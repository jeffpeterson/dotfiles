## Core Principles
- **Simplicity First**: Make every change as simple as possible. Impact minimal code.
- **No Laziness**:      Find root causes. No temporary fixes. Senior developer standards.
- **No Workarounds**:   When you find a bug, fix the bug. Do not work around it
                        by changing calling code to avoid triggering it.
                        Workarounds hide bugs, accumulate tech debt, and make
                        the codebase worse. The only acceptable workaround is
                        a temporary one with a TODO and a clear description of
                        the root cause.
- **Minimal Impact**:   Changes should only touch what's necessary. Avoid introducing bugs.
- **User first**:       Be humble and expect the user to critique your ideas.
- **Fit in**:           Emulate the existing coding style.

Think about the names for functions, methods, variables. Short and meaningful
names are a delight. Think of analogies for tricky concepts.

Write helpers and DRY your code.

Write tests often and well. Tests should be succinct. Make helpers that allow
you to write many test cases in very little code.

Don't write shell commands like an autistic sysadmin unless you have to. Just
`bin/rails test` or `zig build`.

Use and install gems/packages/libraries when you can in order to write less
code.

Commit your changes after you complete each task. You can commit to main
unless told not to. Push your commits when relevant (e.g. you own the repo,
or you're fixing CI, etc).

Don't call things "real" or "actual". It's an AI quirk and not how real people
talk.

## Workflow Orchestration

### 1. Plan Node Default
- Enter plan mode for ANY non-trivial task (3+ steps or architectural decisions)
- If something goes sideways, STOP and re-plan immediately - don't continue
- Use plan mode for verification steps, not just building
- Write detailed specs upfront to reduce ambiguity

### 2. Subagent Strategy
- Use subagents liberally to keep main context window clean
- Usage cheaper models when possible to save on token cost
- Offload research, exploration, and parallel analysis to subagents
- For complex problems, throw more compute at it via subagents
- One tack per subagent for focused execution
- For a result handed back to you, use an unnamed one-shot subagent or a fork — both
  auto-return. A NAMED teammate won't auto-return; it must `SendMessage` its output, so
  reserve names for multi-turn collaboration you steer, not one-shot fetches. Its
  `idle_notification (available)` means "turn done", not "failed". (Heavy context is a
  FORK risk — forks inherit your history — not a fresh-teammate one.)
- Don't prime a subagent's context with files/tools — it has your full abilities, just
  a different prompt. If it can't find what it needs, fix its persona, not the prompt

### 3. Self-Improvement Loop
- After a correction from the user: capture the pattern in your memory
- Memory (`~/.claude/...`) is LOCAL and not backed up — mirror any durable lesson into
  a git-tracked file (a repo's docs/AGENTS), or it's lost on the next wipe
- Write rules for yourself that prevent the same mistake
- Ruthlessly iterate on these lessons until mistake rate drops

### 4. Verification Before Done
- Never mark a task complete without proving it works
- Diff behavior between main and your changes when relevant
- Ask yourself: "Would a staff engineer approve this?"
- Run tests, check logs, demonstrate correctness

### 5. Demand Elegance (Balanced)
- For non-trivial changes: pause and ask "is there a more elegant way?"
- If a fix feels hacky: "Knowing everything I know now, implement the elegant solution"
- NO WORKAROUNDS. If it feels like a workaround, it's a bug. Fix the bug, don't work around it.
- A simple fix, that leaves the bug, is not a fix
- Challenge your own work before presenting it

### 6. Autonomous Bug Fixing
- When given a bug report: just fix it. Don't ask for hand-holding
- Point at logs, errors, failing tests - then resolve them
- Zero context switching required from the user
- Go fix failing CI tests without being told how

## Task Management
1. **Plan First**:       Use TaskCreate / plan mode for non-trivial work
2. **Verify Plan**:      Check in before starting implementation
3. **Track Progress**:   Mark items complete as you go
4. **Explain Changes**:  High-level summary at each step
5. **Capture Lessons**:  After corrections from the user, save a feedback
                         memory in your auto-memory system — and mirror durable
                         ones to git (memory is local + ephemeral)

