param(
    [switch]$SetupOnly
)

# Unified one-click script: first run downloads NirCmd and creates a desktop shortcut,
# subsequent runs toggle between 5120x1440 and 2560x1440 silently.

function Get-ExeDirectory {
    try {
        $path = [System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName
        return [System.IO.Path]::GetDirectoryName($path)
    } catch {
        return $PSScriptRoot
    }
}

$AppName = "Dota2ResolutionSwitcher"
$UserDataDir = Join-Path $env:LOCALAPPDATA $AppName
$null = New-Item -ItemType Directory -Path $UserDataDir -Force | Out-Null

$ExeDir = Get-ExeDirectory
$nircmdLocal = Join-Path $ExeDir "nircmd.exe"
$nircmdData = Join-Path $UserDataDir "nircmd.exe"
$nircmdPath = if (Test-Path $nircmdLocal) { $nircmdLocal } elseif (Test-Path $nircmdData) { $nircmdData } else { $nircmdData }

function Ensure-NirCmd {
    if (Test-Path $nircmdPath) { return $true }
    $zipUrl = "https://www.nirsoft.net/utils/nircmd.zip"
    $zipFile = Join-Path $UserDataDir "nircmd.zip"
    try {
        Invoke-WebRequest -Uri $zipUrl -OutFile $zipFile -UseBasicParsing
        try {
            Expand-Archive -Path $zipFile -DestinationPath $UserDataDir -Force
        } catch {
            Add-Type -AssemblyName System.IO.Compression.FileSystem
            [System.IO.Compression.ZipFile]::ExtractToDirectory($zipFile, $UserDataDir)
        }
        Remove-Item $zipFile -Force -ErrorAction SilentlyContinue
        return (Test-Path $nircmdPath)
    } catch {
        return $false
    }
}

function Create-DesktopShortcut {
    try {
        $shell = New-Object -ComObject WScript.Shell
        $desktop = [Environment]::GetFolderPath("Desktop")
        $shortcutPath = Join-Path $desktop "Dota2 Resolution Switcher.lnk"
        $target = Join-Path $ExeDir (Split-Path -Leaf $PSCommandPath)
        $isExe = $target.ToLower().EndsWith('.exe')
        if (-not $isExe) { $target = $PSCommandPath }
        $sc = $shell.CreateShortcut($shortcutPath)
        $sc.TargetPath = $target
        $sc.WorkingDirectory = $ExeDir
        $sc.Arguments = ""
        $sc.IconLocation = $target
        $sc.Save()
    } catch {}
}

function Get-CurrentResolution {
    Add-Type -AssemblyName System.Windows.Forms
    $screen = [System.Windows.Forms.Screen]::PrimaryScreen
    return @{ Width = $screen.Bounds.Width; Height = $screen.Bounds.Height }
}

function Switch-Resolution {
    $res = Get-CurrentResolution
    $targetWidth = 2560
    $targetHeight = 1440
    if ($res.Width -eq 2560 -and $res.Height -eq 1440) {
        $targetWidth = 5120; $targetHeight = 1440
    } elseif ($res.Width -eq 5120 -and $res.Height -eq 1440) {
        $targetWidth = 2560; $targetHeight = 1440
    }

    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = "cmd.exe"
    $psi.Arguments = "/c `"$nircmdPath`" setdisplay $targetWidth $targetHeight 32"
    $psi.WindowStyle = [System.Diagnostics.ProcessWindowStyle]::Hidden
    $psi.CreateNoWindow = $true
    $psi.UseShellExecute = $false
    $psi.RedirectStandardOutput = $true
    $psi.RedirectStandardError = $true

    $p = New-Object System.Diagnostics.Process
    $p.StartInfo = $psi
    $null = $p.Start()
    $null = $p.StandardOutput.ReadToEnd()
    $null = $p.StandardError.ReadToEnd()
    $p.WaitForExit()
    $exit = $p.ExitCode
    $p.Close()
    return ($exit -eq 0)
}

# Main
if ($SetupOnly) {
    if (-not (Ensure-NirCmd)) {
        try {
            Add-Type -AssemblyName PresentationFramework
            [System.Windows.MessageBox]::Show("Failed to download NirCmd. Please visit https://www.nirsoft.net/utils/nircmd.html and place nircmd.exe in $UserDataDir","Dota2 Resolution Switcher") | Out-Null
        } catch {
            Write-Host "Failed to download NirCmd. Please download manually: https://www.nirsoft.net/utils/nircmd.html" -ForegroundColor Red
            Write-Host "Place nircmd.exe in: $UserDataDir" -ForegroundColor Yellow
        }
        exit 1
    }
    Create-DesktopShortcut
    try {
        Add-Type -AssemblyName PresentationFramework
        [System.Windows.MessageBox]::Show("Setup complete. A desktop shortcut was created (if possible).","Dota2 Resolution Switcher") | Out-Null
    } catch {
        Write-Host "Setup complete. A desktop shortcut was created (if possible)." -ForegroundColor Green
    }
    exit 0
}

if (-not (Test-Path $nircmdPath)) {
    if (-not (Ensure-NirCmd)) {
        # Last resort message box for non-technical users
        Add-Type -AssemblyName PresentationFramework
        [System.Windows.MessageBox]::Show("Failed to download NirCmd. Please visit https://www.nirsoft.net/utils/nircmd.html and place nircmd.exe in $UserDataDir","Dota2 Resolution Switcher") | Out-Null
        exit 1
    } else {
        Create-DesktopShortcut
    }
}

# Toggle resolution silently
$ok = Switch-Resolution
if (-not $ok) {
    # Brief message then exit
    try {
        Add-Type -AssemblyName PresentationFramework
        [System.Windows.MessageBox]::Show("Failed to change resolution. Try running as Administrator.","Dota2 Resolution Switcher") | Out-Null
    } catch {}
}
exit 0
