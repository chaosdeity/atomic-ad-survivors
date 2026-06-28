# Yunseo 96px-First Walk Sheet Next Prompt

Use this for the next AI/art pass.

## Objective

Create a Yunseo walk sheet that passes at 96px first, then survives 64px, 48px, and R01 480x270 gameplay presentation before any Godot runtime integration.

## Required Output

- 4 directions: down, left, right, up.
- 4 frames per direction.
- First working sheet path:

```text
assets/art_staging/yunseo_walk_96px_first_v01/sprite_sheet_96.png
```

- Sheet layout: rows are down, left, right, up; columns are frames 1-4.
- Cell size: 96x96.
- Pivot target: `(48, 86)`.

## Art Criteria

- Yunseo identity must remain consistent with the existing v06 idle/action poses.
- Walk must read from foot plant and weight transfer, not from bobbing alone.
- Down/up frames must show visible alternating contact.
- Left/right frames must avoid sliding, cut feet, or one-legged reads.
- No overwrite of existing walk folders.
- Do not modify the existing 8 action poses.

## QA Gates Before Integration

1. 96px contact sheet PASS.
2. 64px contact sheet PASS.
3. 48px contact sheet PASS.
4. R01 480x270 gameplay mock/contact sheet PASS.
5. Asset self-QA report PASS.

Only after these pass should Godot integration begin.

## Integration Hold Rule

Do not enable default walk in runtime until the sheet has passed all asset gates.