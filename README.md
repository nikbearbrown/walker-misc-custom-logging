# Walker — Custom Logging

**What this is.** An independent local adaptation of Godot's `misc/custom_logging`
demo: an autoloaded custom logger copies everything the engine prints into an
in-game console, and a row of buttons prints messages, warnings and errors on
demand. It is a tech demo, not a game.

**Why it is in Walker.** It is one of Walker's Godot demo adaptations: an
independent copy checked headlessly and queued for two Liam films (see
FRICTIONAL.md). Whether it should stay a demo or become a console utility for
Walker games is an open question (design/decisions.md, Q-01).

**What was found and verified.** The only runtime change is the Walker window
title. A separate `godot/test_input.gd` checks real input and logger state
without opening a visible window. Embedded font licenses/attribution still need
an audit before redistribution. A recovered design description now exists in
`GDD.md`; it describes the code and approves nothing.

## How to run

Open `godot/project.godot` in Godot 4.7 (evidence logs were produced with Godot
4.7.2) and run the project. The startup errors and warnings in the console are
the demo's own deliberate content, not failures.

Controls: click the buttons along the bottom — Print Message, Print Message
(raw), Print Message (stderr), Print Warning, Print Error, Open Logs Folder,
Crash Engine. **Crash Engine really crashes the engine** (on purpose, to show a
crash trace in the log file). There are no custom input actions.

## Design

The design package is a **recovered, unapproved description** of what the code
does, written by the Walker `/gdd reverse` pass in silent mode. No design gate
has been signed.

- [GDD.md](GDD.md) — recovered Game Design Document (identical copy of `design/GDD.md`)
- [design/DECK.html](design/DECK.html) — review slides
- [design/IMPLEMENTATION-MAP.md](design/IMPLEMENTATION-MAP.md) — feature → scene/script paths
- [design/decisions.md](design/decisions.md) — open questions the code cannot answer

## Source & license

Independent local adaptation of Godot `misc/custom_logging`, source commit
`a3b5c113112f77291d5f3d1360f33a882fdc52f7`. Source checkout is preserved.
Godot contributor MIT notice is retained in LICENSE.md. Original README, font
assets, UIDs and import settings remain under godot. Audit embedded font
licenses/attribution before redistribution; no publishing is performed here.

## Status

- Runtime change: Walker window title only.
- Separate `godot/test_input.gd` checks real input and logger state without
  opening a visible window. FRICTIONAL.md records 15 passing headless checks
  (`input-20260924.log`); Crash Engine and Open Logs Folder were intentionally
  not clicked, and thread-stress safety, file flush and visual layout remain
  unverified.
- Both native-4K Liam films are pending under the existing visible-capture
  blocker.

Repository: https://github.com/nikbearbrown/walker-misc-custom-logging
