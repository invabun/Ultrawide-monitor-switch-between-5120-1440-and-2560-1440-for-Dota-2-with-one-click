$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
Push-Location $root
try {
    $dist = Join-Path $root 'dist'
    if (-not (Test-Path $dist)) {
        New-Item -ItemType Directory -Path $dist | Out-Null
    }

    $ps2exe = Join-Path $root 'ps2exe.ps1'
    if (-not (Test-Path $ps2exe)) {
        $url = 'https://raw.githubusercontent.com/MScholtes/PS2EXE/master/ps2exe.ps1'
        Write-Host "Downloading PS2EXE from $url" -ForegroundColor Cyan
        Invoke-WebRequest -Uri $url -OutFile $ps2exe -UseBasicParsing
    }

    $inputFile = Join-Path $root 'Dota2ResolutionSwitcher.ps1'
    $outputFile = Join-Path $dist 'Dota2ResolutionSwitcher.exe'

    Write-Host "Building EXE -> $outputFile" -ForegroundColor Cyan
    & powershell.exe -ExecutionPolicy Bypass -File $ps2exe `
        -inputFile $inputFile `
        -outputFile $outputFile `
        -noConsole `
        -title 'Dota2 Resolution Switcher' `
        -product 'Dota2 Resolution Switcher' `
        -version '1.0.0.0'

    Write-Host "Built EXE at $outputFile" -ForegroundColor Green
}
finally {
    Pop-Location
}
