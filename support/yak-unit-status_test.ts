// Exercise the installed user manager, never a yak graph or a live yak unit.
// Every unit and process here belongs to this probe and is removed on exit.
const run = async (...args: string[]) => {
  const result = await new Deno.Command("systemctl", {
    args: ["--user", ...args],
    stdout: "piped",
    stderr: "piped",
  }).output();
  if (!result.success) throw new Error(new TextDecoder().decode(result.stderr));
  return new TextDecoder().decode(result.stdout).trim();
};
const until = async (fact: () => Promise<boolean>) => {
  const end = Date.now() + 10_000;
  while (!await fact()) {
    if (Date.now() >= end) throw new Error("probe condition timed out");
    await new Promise((done) => setTimeout(done, 25));
  }
};
const equal = (actual: unknown, expected: unknown) => {
  if (actual !== expected) {
    throw new Error(`expected ${expected}, got ${actual}`);
  }
};

for (const role of ["work", "web", "tracker", "tracker-web"]) {
  Deno.test(`yak-${role}: deliberate drain is clean, unexpected 143 recovers`, async () => {
    const source = await Deno.readTextFile(
      new URL(
        `../home/.config/systemd/user/yak-${role}@.service`,
        import.meta.url,
      ),
    );
    const policy = source.split("\n").filter((line) =>
      /^(Restart|SuccessExitStatus|RestartForceExitStatus)=/.test(line)
    ).join("\n");
    const dir = await Deno.makeTempDir({ prefix: "yak-unit-status-" });
    const unit = `yak-status-probe-${crypto.randomUUID()}.service`;
    const file = `${Deno.env.get("XDG_RUNTIME_DIR")}/systemd/user/${unit}`;
    const state = (property: string) =>
      run("show", unit, `--property=${property}`, "--value");
    try {
      await Deno.writeTextFile(
        `${dir}/worker.py`,
        `import signal,sys\ndef stop(*_):\n open(${
          JSON.stringify(`${dir}/exit`)
        },'w').write('143')\n sys.exit(143)\nsignal.signal(signal.SIGTERM,stop)\nopen(${
          JSON.stringify(`${dir}/ready`)
        },'w').write('ready')\nwhile True:signal.pause()\n`,
      );
      await Deno.writeTextFile(
        file,
        `[Unit]\nDescription=isolated yak exit policy probe\n[Service]\nExecStart=/usr/bin/python3 ${dir}/worker.py\nExecStopPost=/bin/sh -c 'echo "$EXIT_STATUS:$SERVICE_RESULT" > ${dir}/exit'\n${policy}\nRestartSec=50ms\nTimeoutStopSec=5s\n`,
      );
      await run("daemon-reload");
      await run("start", unit);
      await until(async () => {
        try {
          await Deno.stat(`${dir}/ready`);
          return true;
        } catch (error) {
          if (error instanceof Deno.errors.NotFound) return false;
          throw error;
        }
      });
      await run("stop", unit);
      equal(await state("ActiveState"), "inactive");
      equal(await state("Result"), "success");
      equal((await Deno.readTextFile(`${dir}/exit`)).trim(), "143:success");
      await Deno.remove(`${dir}/ready`);
      await run("start", unit);
      await until(async () => {
        try {
          await Deno.stat(`${dir}/ready`);
          return true;
        } catch (error) {
          if (error instanceof Deno.errors.NotFound) return false;
          throw error;
        }
      });
      const invocation = await state("InvocationID");
      await Deno.remove(`${dir}/ready`);
      // This is not systemctl stop: force-restart policy must still recover.
      await run("kill", "--kill-whom=main", "--signal=TERM", unit);
      await until(async () =>
        await state("ActiveState") == "active" &&
        await state("InvocationID") != invocation
      );
      equal(await state("NRestarts"), "1");
      await until(async () => {
        try {
          await Deno.stat(`${dir}/ready`);
          return true;
        } catch (error) {
          if (error instanceof Deno.errors.NotFound) return false;
          throw error;
        }
      });
      await run("stop", unit);
      equal(await state("ActiveState"), "inactive");
      equal(await state("Result"), "success");
      console.log(
        `${role}: explicit stop inactive/success/143; unexpected 143 restarted once`,
      );
    } finally {
      await run("stop", unit).catch(() => {});
      await run("reset-failed", unit).catch(() => {});
      await Deno.remove(file).catch(() => {});
      await run("daemon-reload");
      await Deno.remove(dir, { recursive: true });
    }
  });
}
