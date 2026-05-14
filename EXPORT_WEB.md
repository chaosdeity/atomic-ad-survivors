# Web Export

This project can be exported as a Godot Web build and served locally from `exports/web`.

Verified local environment on 2026-05-14:

- Godot CLI found: `Godot_v4.6.2-stable_win64_console.exe`
- Godot version: `4.6.2.stable.official.71f334935`
- Export templates found: `%APPDATA%\Godot\export_templates\4.6.2.stable`
- Web preset: `Web`
- Export output: `exports/web/index.html`

Do not commit generated files from `exports/`. The folder is ignored by `.gitignore`.

## Install Web Export Templates

If export fails with a missing template error:

1. Open the project in Godot.
2. Select `Editor > Manage Export Templates`.
3. Install the templates for the exact Godot version you are using.
4. Re-run the export.

For CLI-only setup, download the matching Godot export templates package from the official Godot downloads page and install/extract it into Godot's export template directory for your version.

## Export From Godot Editor

1. Open this folder in Godot 4.x.
2. Confirm the main scene is `res://scenes/main.tscn`.
3. Select `Project > Export`.
4. Choose the `Web` preset.
5. Export to:

```text
exports/web/index.html
```

Godot should create files such as `index.html`, `.wasm`, `.pck`, and `.js` in `exports/web`.

## Export From CLI

From the repository root:

```powershell
godot --headless --export-release Web exports/web/index.html
```

If `godot` is not on `PATH`, call the console executable directly. Example:

```powershell
& "C:\Path\To\Godot_v4.x-stable_win64_console.exe" --headless --export-release Web exports/web/index.html
```

## Serve Locally

Browsers should open the exported game through a local HTTP server. Do not double-click `index.html`.

The exported Web build loads `.wasm`, `.pck`, and JavaScript files through browser APIs that expect HTTP headers and same-origin requests. Opening the file directly with a `file://` URL can block those requests or make the WebAssembly loader fail.

PowerShell helper:

```powershell
.\tools\serve_web.ps1
```

Expected URL:

```text
http://localhost:8000
```

Optional custom port:

```powershell
.\tools\serve_web.ps1 -Port 8010
```

Manual Python server:

```powershell
cd exports/web
python -m http.server 8000
```

If Python is installed through the Windows launcher:

```powershell
cd exports/web
py -3 -m http.server 8000
```
