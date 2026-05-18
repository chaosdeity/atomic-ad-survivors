$ErrorActionPreference = "Stop"

$RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$DefaultGodotPath = "C:\workspace\cog_gaya_project\tools\godot-4.6.2\Godot_v4.6.2-stable_win64_console.exe"

function Resolve-GodotPath {
    if (Test-Path -LiteralPath $DefaultGodotPath) {
        Write-Host "[INFO] Godot: $DefaultGodotPath"
        return $DefaultGodotPath
    }

    foreach ($candidate in @("godot", "godot4")) {
        $command = Get-Command $candidate -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($null -ne $command) {
            Write-Host "[INFO] Godot: $($command.Source)"
            return $command.Source
        }
    }

    Write-Host "[FAIL] Godot executable not found." -ForegroundColor Red
    Write-Host "       Tried default path: $DefaultGodotPath"
    Write-Host "       Then tried PATH candidates: godot, godot4"
    exit 1
}

function Invoke-QAStep {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Name,

        [Parameter(Mandatory = $true)]
        [string] $Command,

        [Parameter(Mandatory = $true)]
        [string[]] $Arguments
    )

    Write-Host ""
    Write-Host "[START] $Name" -ForegroundColor Cyan

    try {
        & $Command @Arguments
        $exitCode = $LASTEXITCODE
    }
    catch {
        Write-Host "[FAIL] $Name" -ForegroundColor Red
        Write-Host "       $($_.Exception.Message)"
        exit 1
    }

    if ($exitCode -ne 0) {
        Write-Host "[FAIL] $Name (exit code $exitCode)" -ForegroundColor Red
        exit $exitCode
    }

    Write-Host "[PASS] $Name" -ForegroundColor Green
}

Set-Location $RepoRoot

$GodotPath = Resolve-GodotPath

Invoke-QAStep "Logic invariant check" "python" @("tools\logic_invariant_check.py")
Invoke-QAStep "Balance simulation" "python" @("tools\balance_sim.py")
Invoke-QAStep "Godot headless main scene" $GodotPath @("--headless", "--path", ".", "scenes/main.tscn", "--quit-after", "2")
Invoke-QAStep "Git whitespace check" "git" @("diff", "--check")

Write-Host ""
Write-Host "[PASS] Local QA check completed." -ForegroundColor Green
