# Codex Operating Rules

## Token-Saving Rules

- Do not scan the entire repository by default. Start with targeted file discovery using filenames, paths, or `rg` queries relevant to the task.
- Before reading files, identify at most 10 candidate files or folders and briefly state why each is relevant.
- Read only the necessary sections of long files. For large source files, use search results and nearby line ranges instead of opening the full file.
- Do not analyze `node_modules`, lockfiles, `dist`, `build`, `coverage`, `.godot`, `exports`, `generated_assets`, generated binaries, image dumps, or bulk asset folders unless the user explicitly asks.
- Long design, policy, PMO, worldbuilding, prompt, and roadmap documents must be read only when directly relevant to the current task.
- Keep investigation and modification separate. First report findings and proposed files to change; only edit after user approval when the task is broad or policy-related.
- Do not run full QA or full test suites without user approval. Prefer the smallest relevant check.
- When inspecting logs or command output, show at most 80 relevant lines by default. Prefer errors, failures, stack traces, and the final summary.
- For Godot tasks, prefer targeted files under `scenes/`, `scripts/`, `tools/`, or `data/` based on the requested feature. Avoid opening `scripts/main.gd` in full.
- Every final report must list the files actually read and explain the evidence used for the conclusion.

## PMO Execution Rules

- For broad cleanup, packaging, branch, PR, world/story lock, or QA work, follow `audit -> plan -> execute -> verify -> report` unless the user explicitly approves a narrower direct action.
- Do not delete, move, archive, stage, or commit without an exact target list and explicit approval for that action.
- Before cleanup execution, separate tracked, untracked, ignored, generated/cache/export, source, and external-output files; treat tracked user work as preserve-first.
- A PASS verdict needs concrete evidence such as diff, log, test, count gate, screenshot, render, results file, or another task-appropriate proof.
- High-risk S2/S3 work, including destructive filesystem actions, broad repo changes, canonical world/story locks, runtime/gameplay changes, or branch/PR cleanup, requires user approval before execution.
- PMO reports must state the files actually read, evidence used, actions not executed, and any remaining approval gates.
