## Core Principles
- **Simplicity First**: The simplest system, not the smallest diff. Keep concerns
                        separated, interfaces useful, and the whole elegant.
- **Pure core**:        The core of a system is pure logic and data. Effects,
                        control code and anything imperative live at
                        well-defined boundaries, and those boundaries are
                        generic: OAuth implemented once, providers given as data.
- **No Laziness**:      Find root causes. No temporary fixes. Senior developer standards.
- **No Workarounds**:   When you find a bug, fix the bug. Do not work around it
                        by changing calling code to avoid triggering it.
                        Workarounds hide bugs, accumulate tech debt, and make
                        the codebase worse. The only acceptable workaround is
                        a temporary one with a TODO and a clear description of
                        the root cause.
- **Serve consumers**:  When an interface doesn't serve what its callers need,
                        change the interface and move every caller onto it in
                        the same change. Never reach down through a layer or
                        leak through an abstraction to get around it.
- **Leave it better**:  Fix what you find wrong, and leave the code better than
                        you found it.
- **User first**:       Be humble and expect the user to critique your ideas.
- **Fit in**:           Emulate the existing coding style.

Think about the names for functions, methods, variables. Short and meaningful
names are a delight. Think of analogies for tricky concepts.

Write helpers and DRY your code.

Write tests well: a test checks behavior through an interface and fails only
when the code is wrong or its behavior changed on purpose, never a decision the
code already states. Tests should be succinct. Make helpers that allow you to
write many test cases in very little code. The test suite is expected to run
very very fast. Try your best to keep it under a few seconds, but never delete a
test of behavior to resolve this constraint.

Use and install gems/packages/libraries when you can in order to write less
code.

Commit your changes after you complete each task. Work in a worktree and merge
to main with --ff-only to prevent conflicts on main. Push your commits when relevant (e.g. you own the repo,
or you're fixing CI, etc).

Don't call things "real", "actual", or "honest". It's an AI tic.

## Workflow Orchestration

### 1. Plan Beforehand
- Make a plan for any non-trivial task (3+ steps or architectural decisions)
- If something goes sideways, STOP and re-plan immediately - don't continue
- Use plan mode for verification steps, not just building
- Write detailed specs upfront to reduce ambiguity

### 2. Subagent Strategy
- Use subagents liberally to keep main context window clean
- Use cheaper models when possible to save on token cost
- Offload research, exploration, analysis, and implementation to subagents
- For complex problems, throw more compute at it via subagents
- One tack per subagent for focused execution
- Don't prime a subagent context with files reads or tool calls; give what it
  needs from your context and trust it to use its own tools.

### 3. Self-Improvement Loop
- After a correction from the user: capture the pattern durably
- Store any durable lesson into a git-tracked file, or it's lost on the next wipe
- Write rules for yourself that prevent the same mistake
- Ruthlessly iterate on these lessons until mistake rate drops
- Do not store provenance information (why, when) this belongs in git commits.

### 4. Verification Before Done
- Never mark a task complete without proof it works
- Diff behavior between main and your changes when relevant
- Ask yourself: "Would a staff engineer approve this?"
- Run tests, check logs, demonstrate correctness

### 5. Demand Elegance (Balanced)
- For non-trivial changes: pause and ask "is there a more elegant way?"
- NO WORKAROUNDS. If it feels like a workaround, it's a bug. Fix the bug, don't work around it.
- A simple fix that leaves the bug, is not a fix
- Challenge your own work before presenting it

### 6. Autonomous Bug Fixing
- When given a bug report: just fix it. Don't ask for hand-holding
- Point at logs, errors, failing tests - then resolve them
- Zero context switching required from the user
- Go fix failing CI tests without being told how

## Task Management
1. **Plan First**:       Use plan mode for non-trivial work
2. **Verify Plan**:      Check it before starting implementation
3. **Track Progress**:   Mark items complete as you go
4. **Explain Changes**:  High-level summary at each step
5. **Capture Lessons**:  After corrections from the user, save it durably and
                         cleanly. Simply delete bad context when possible.

