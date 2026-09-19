# Motion proof failure ledger

## Preflight: Blender unavailable
- Failed method: resolve Blender from PATH, standard install locations, registry, and tool folders.
- Evidence: no installed winget package and no blender.exe found during initial preflight.
- Cause: no usable installed Blender executable in the checked locations.
- Reuse ban: do not claim production or validation completed without executing Blender.
- Replacement: user explicitly authorized Blender installation on 2026-09-05; install official package.
- Validation gate: Blender --version and background Python generation must execute successfully.

## Inherited validation constraints
- Do not treat resource load or headless execution as visual PASS.
- Do not use headless Movie Maker or dummy SubViewport screenshot capture.
- Use real renderer captures, measured state/input tests, and visual inspection separately.
- Existing project is read-only. All outputs must use new paths. At most two production correction cycles.

## Installation: MSI elevation wait
- Failed method: winget silent MSI install.
- Evidence: winget reported administrator prompt, consent and msiexec processes remained; no Blender executable installed at the checked location. Winget wait interrupted.
- Cause: secure-desktop elevation cannot be answered through available automation.
- Reuse ban: do not retry elevated MSI unattended.
- Replacement: official portable ZIP in this isolated experiment, no elevation or global settings required.
- Validation gate: SHA256 matches official checksum; extracted blender.exe --version and background execution succeed.

## Production correction 1: nonzero GLB start time
- Failed method: export NLA clips whose first baked key is frame 1 without sliding animation to zero.
- Evidence: run01/evidence/game_checks_0.json: imported lengths 2.041666746, 1.041666627, 1.041666627; three duration failures. Other 27 gameplay checks passed. Source GLB spans are 2/1/1 seconds but first keys start at 1/24 second.
- Cause: exported timeline offset becomes leading time in Godot Animation length.
- Reuse ban: do not reuse nonzero clip start or relax the duration assertion.
- Replacement: export_anim_slide_to_zero=True, regenerate as run02; retain run01 unchanged.
- Validation gate: imported lengths 2/1/1 within .02 seconds, all gameplay tests pass, real renderer captures reviewed.

## Production correction 2: walk boot penetrates floor
- Failed method: cancel thigh/shin Euler angles directly on foot bone assuming identical local X axes.
- Evidence: run02/evidence/source_checks.log: planted boot minimum z is -0.174718 to -0.097440 during walk, beyond 0.005 ground tolerance. Prior input/loop/capture checks do not override this physical defect.
- Cause under inspection: foot rest basis differs from descending leg bones; direct local Euler cancellation is not world-space leveling.
- Reuse ban: do not reuse unchecked local-axis foot compensation or declare ground contact PASS from screenshots.
- Replacement: inspect rest bases and correct foot compensation in a fresh run03.
- Validation gate: every baked frame has a planted sole within 0.005 of z=0, no XY root travel; rerun GLB import, gameplay, loop and real-renderer visual checks. This is the final allowed production correction.

## Environment cleanup: abandoned elevation processes
- Failed method: terminate only the known MSI/elevation processes from the initial install attempt after stopping its winget process.
- Evidence: Stop-Process for msiexec PID 116072 and consent PID 114840 returned Access denied. No other processes were targeted.
- Cause: protected elevated processes cannot be controlled by this session.
- Reuse ban: do not escalate, force a security bypass, or kill unrelated installer processes.
- Replacement: leave portable Blender operational; tell the user to cancel the original administrator prompt if still visible.
- Validation gate: portable executable and artifact tests already pass; no claim that the elevated installer was successfully cancelled.

