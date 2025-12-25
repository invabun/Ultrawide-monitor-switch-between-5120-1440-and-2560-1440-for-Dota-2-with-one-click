# Resolution Switch Script using NirCmd
# Switch between 2560x1440 and 5120x1440

$nircmdExe = Join-Path $PSScriptRoot "nircmd.exe"

if (-not (Test-Path $nircmdExe)) {
    Write-Host "NirCmd.exe not found!"
    Write-Host "Please run setup_nircmd.ps1 first, or download manually from:"
    Write-Host "https://www.nirsoft.net/utils/nircmd.html"
    Write-Host ""
    Write-Host "Place nircmd.exe in: $PSScriptRoot"
    Start-Sleep -Seconds 3
    exit
}

# Get current resolution using Screen class (more reliable, no NirCmd popup)
Add-Type -AssemblyName System.Windows.Forms
$screen = [System.Windows.Forms.Screen]::PrimaryScreen
$currentRes = "$($screen.Bounds.Width)x$($screen.Bounds.Height)"

# Determine target resolution (silently)
if ($currentRes -eq "2560x1440") {
    $targetWidth = 5120
    $targetHeight = 1440
} elseif ($currentRes -eq "5120x1440") {
    $targetWidth = 2560
    $targetHeight = 1440
} else {
    $targetWidth = 2560
    $targetHeight = 1440
}

# Change resolution using NirCmd (completely silent - no popup windows)
# Use cmd /c to ensure window is completely hidden
$processInfo = New-Object System.Diagnostics.ProcessStartInfo
$processInfo.FileName = "cmd.exe"
$processInfo.Arguments = "/c `"$nircmdExe`" setdisplay $targetWidth $targetHeight 32"
$processInfo.WindowStyle = [System.Diagnostics.ProcessWindowStyle]::Hidden
$processInfo.CreateNoWindow = $true
$processInfo.UseShellExecute = $false
$processInfo.RedirectStandardOutput = $true
$processInfo.RedirectStandardError = $true

$process = New-Object System.Diagnostics.Process
$process.StartInfo = $processInfo
$null = $process.Start()
$null = $process.StandardOutput.ReadToEnd()
$null = $process.StandardError.ReadToEnd()
$process.WaitForExit()
$process.Close()

if ($process.ExitCode -eq 0) {
    # Resolution changed successfully - exit silently
    exit 0
} else {
    # Show error briefly then exit
    Write-Host "Failed to change resolution. Error code: $($process.ExitCode)"
    Write-Host "Try running as Administrator."
    Start-Sleep -Seconds 2
    exit 1
}


