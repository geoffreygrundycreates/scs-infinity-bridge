# SCS × Infinity UI++ Compatibility Bridge

A lightweight WeiDU mod that addresses interface conflicts between **Sword Coast Stratagems (SCS)** and **Infinity UI++**. It patches the existing interface rather than replacing it. Each fix can be installed or uninstalled separately.

## What it fixes

| Component | Fix |
|---|---|
| **0 — Class and kit names** | Hides SCS's `{K=...,C=...}` codes in supported character-creation, character-selection, inventory, character-record and class/level displays. |
| **5 — Missing UI text** | Restores Infinity UI++'s missing localisation helper on layouts where it is absent. |
| **10 — Startup errors** | Attempts to repair *recognisable* SCS-generated `M_DW_OOD.lua` / `onOpen` corruption without discarding valid handlers. **Experimental.** |
| **15 — Text filtering** | Prevents SCS's class-name filter from also removing unrelated text inside `{braces}`. |
| **20 — Five-point thief skills** | When SCS component **#4115** is installed, connects its five-point thief-skill allocation to Infinity UI++'s character-creation and level-up controls. **Experimental.** |
| **30 — Revised resting** | Integrates SCS's revised resting controls when SCS component **#4135** is installed. |
| **40 — Revised inns** | Integrates SCS's revised inn-room controls when SCS component **#4140** is installed. |

The bridge does **not** enable optional SCS features you have not installed. It does not alter SCS combat AI or game rules.

## What it does not fix

- **SCS NPC Customisation & Management (#4100):** Character-creation compatibility is not addressed. **Avoid installing this SCS component if you want to minimise known UI conflicts.**
- **Icewind Dale spell additions:** Reported character-creation conflicts are not addressed. These are not confirmed in every setup; for a cautious installation, leave the relevant SCS spell additions disabled.
- **SCS difficulty fine-tuning interface:** Not modified by this bridge.
- **Every possible startup failure:** Component 10 cannot repair all malformed `M_DW_OOD.lua` handlers, including some unnamed-handler corruption.
- **Every other UI mod:** Other interface replacements or custom layouts are not guaranteed to work with this bridge.

Components **10** and **20** still require broader in-game testing. Install them separately so that any problems can be traced to a particular component.

## Requirements and installation

1. Install **Infinity UI++**, then **SCS**. Install this bridge **after both**, and after other UI-changing mods.
2. Uninstall any earlier bridge version with WeiDU before replacing its files.
3. Extract the release into your game's main directory (the folder containing `chitin.key`). Keep the `scs-infinity-bridge` folder intact.
4. Run `setup-scs-infinity-bridge.exe` and select the components you need. If the release does not contain an installer executable, copy a working WeiDU `setup-*.exe` in the game directory and rename the **copy** to `setup-scs-infinity-bridge.exe`.
5. To diagnose issues, install components **individually**. Start with **0**, test the affected menus, then add the others as needed.

The installer checks for **both Infinity UI++ and SCS**. Feature-specific components also check that the relevant SCS feature is installed. WeiDU supports uninstalling each component independently.

## Bug reports

Report issues at **https://github.com/geoffreygrundycreates/scs-infinity-bridge/issues**.

Include the game, Infinity UI++ and SCS versions, installed bridge component numbers, a short description of the affected screen, steps to reproduce, and any startup error text. Attach `WeiDU.log` and a screenshot if relevant.
