param(
    [int]$Port = 8000,
    [string]$ExportDir = (Join-Path $PSScriptRoot "..\exports\web")
)

$resolvedExportDir = Resolve-Path -LiteralPath $ExportDir -ErrorAction SilentlyContinue

if (-not $resolvedExportDir) {
    Write-Error "Export directory not found: $ExportDir. Export the Web preset to exports/web/index.html first."
    exit 1
}

$indexPath = Join-Path $resolvedExportDir.Path "index.html"
if (-not (Test-Path -LiteralPath $indexPath)) {
    Write-Error "index.html not found in $($resolvedExportDir.Path). Export the Web preset before starting the server."
    exit 1
}

$python = Get-Command python -ErrorAction SilentlyContinue | Select-Object -First 1
$pyLauncher = Get-Command py -ErrorAction SilentlyContinue | Select-Object -First 1

Write-Host "Serving $($resolvedExportDir.Path)"
Write-Host "Open http://localhost:$Port"
Write-Host "Press Ctrl+C to stop."

Push-Location $resolvedExportDir.Path
try {
    if ($python) {
        & $python.Source -m http.server $Port
    } elseif ($pyLauncher) {
        & $pyLauncher.Source -3 -m http.server $Port
    } else {
        Write-Error "Python was not found. Install Python, or serve exports/web with any local HTTP server."
        exit 1
    }
} finally {
    Pop-Location
}
