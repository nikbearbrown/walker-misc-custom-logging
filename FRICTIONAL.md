# Verification and friction — 2026-09-24

Read both scripts, both scenes, project settings and upstream README. No local
AGENTS.md was found in the source misc directory. No duplicate renderer or
Godot process was running at preflight.

Godot 4.7.2 headless editor import exited 0 (`import-20260924.log`). Normal main
scene ran 120 frames and exited 0 (`runtime-20260924.log`). Its deliberate
`Error 1/2` and `Warning 1/2` emissions are the demo content, not engine failures.

`input-20260924.log` records 15 passing checks, exit 0. A 1920x1080 headless
viewport instantiated the real main scene with its configured logger autoload.
Initial stdout, stderr, raw, error and warning text reached the RichTextLabel.
Actual mouse press/release events through root.push_input activated five print
buttons; each incremented its counter and appended the expected message to the
in-game console. Printed test verdicts also pass through this logger. Intentional
button warning/error messages were observed; there were no script failures or
leak warnings in this run.

Crash Engine and Open Logs Folder were intentionally not clicked: they would
crash the process or open external UI. Thread-stress safety, crash traces, file
flush durability, visual colors/layout, script/shader error formatting and
scroll behavior remain unverified. A headless text check is not a rendered film.

The shared user-closed capture blocker is unchanged. Both native-4K films and
human review stay pending; next feasible source may be inspected without
retiring this item or asserting visual verification.
