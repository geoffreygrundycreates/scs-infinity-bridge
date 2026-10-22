# SCS × Infinity UI++ Compatibility Bridge — v0.5.4 Alpha

## Included

Each WeiDU component can be installed or uninstalled independently.

| ID | Feature | Condition |
|---|---|---|
| 0 | Class and kit code filtering in character creation, inventory, character selection, record screens, and applicable class/level displays | Infinity UI++ and SCS installed |
| 5 | Missing `t()` localisation fallback | `t()` absent |
| 10 | Conservative recovery of recognised SCS `M_DW_OOD.lua` onOpen corruption (experimental) | SCS onOpen runtime present |
| 15 | Narrow SCS filtering to `{K=...,C=...}` metadata, preserving unrelated `{...}` | SCS class filter runtime present |
| 20 | Five-point thief-skill controls, completion, and cancellation integration (experimental) | SCS #4115 installed |
| 30 | Revised resting UI integration | SCS #4135 installed |
| 40 | Revised inn-room UI integration | SCS #4140 installed |

## Not included

- SCS difficulty fine-tuning UI.
- NPC Customisation & Management (#4100).
- IWD spell additions and unrelated spell-system character-creation fixes.
- Unrecognised malformed startup Lua or integration with arbitrary third-party UI mods.
- A guarantee of compatibility with every future mod: runtime testing remains necessary.

## Requirements

- BGEE, BG2EE, EET or other supported Enhanced Edition game with both Infinity UI++ and SCS installed.
- A WeiDU installer named `setup-scs-infinity-bridge` (`.exe` on Windows).

## Installation

1. Install Infinity UI++, then SCS.
2. Uninstall previous versions of this bridge using WeiDU **before replacing its files**.
3. Extract this package into the game directory alongside `chitin.key`.
4. Run `setup-scs-infinity-bridge` and select components individually.
5. Start with component 0 and confirm character creation, inventory and record displays before enabling other components.
6. Install the bridge last among mods that change these UI resources.

WeiDU handles backups and per-component uninstallation. Components 10 and 20 have not been runtime-verified in BGEE and should be tested on backed-up installations.
