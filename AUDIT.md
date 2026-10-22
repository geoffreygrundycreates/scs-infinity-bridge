# Source audit — v0.5.4 alpha

## Class/kit display paths

| Location | Source expression | v0.5.4 coverage |
|---|---|---|
| Character creation, general | `chargen.information` and `rgGetChargenInfo(1..4)` | Added, including SCS-wrapped expressions |
| Character creation, class/kit options | `Infinity_FetchString(chargen.class/kit[rowNumber].name)` | Retained v0.5.3 and added unindented fallback |
| Character import | `character_select[rowNumber].name` | Added, raw and SCS-wrapped |
| Inventory class heading | `characters[rgInvId].class` or `rgString(...)` | Added raw and SCS-wrapped, including nested wrapper variant |
| Character record, class levels | `classlevel.first/second/third.details`, `getClassString()` | Existing v3-derived logic retained |
| Character description | `char.class` inside `characterDescString()` | Added |
| Dual-class, character and level-up labels | `characters[currentID].class` | Existing rules plus wrapped fallback |
| Bestiary level extraction | `rgGetClassLevelNumber()` on classlevel details | Added metadata filtering before extraction |

## Additional audit finding

Component 15 previously contained a replacement expression that could remove an arbitrary brace-delimited block directly preceding an SCS tag. The replacement now matches `{K=...,C=...}` only. No other component behaviour was changed from v0.5.3.

## Static tests

- Checked the component 0 substitutions against the supplied unmodified, older, v1.31 source, and previously working v3 UI menus.
- Tested direct and `dwFilterKitDesc(...)`-wrapped forms of the principal class/kit labels.
- Checked that representative unrelated UI labels remain unchanged by the class-display replacements.
- Checked that all seven WeiDU component definitions remain individually selectable.
- Checked ZIP integrity.

## Outstanding runtime verification

- No live BGEE launch or WeiDU installation was available for this audit. Source matching is not a gameplay test.
- Component 10 only handles recognisable named `onOpen` corruption; an unnamed `dwOnOpenDefault=function()` corruption reported publicly remains unhandled and must not be silently discarded.
- Component 20's thief allocation workflow still requires runtime testing across character creation, level-up, cancel, and character switching.
- Rest/inn components 30/40 are unchanged from v0.5.3 and were not independently runtime-verified.
- Additional Infinity UI++/SCS combinations, languages and other mods may use class display expressions that do not match these supported forms.
