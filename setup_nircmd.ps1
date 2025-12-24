# Download and setup NirCmd for resolution switching

Write-Host "NirCmd Setup Script"
Write-Host "==================="
Write-Host ""

$nircmdUrl = "https://www.nirsoft.net/utils/nircmd.zip"
$zipFile = "$PSScriptRoot\nircmd.zip"
$nircmdExe = "$PSScriptRoot\nircmd.exe"

if (Test-Path $nircmdExe) {
    Write-Host "NirCmd.exe already exists. Skipping download."
} else {
    Write-Host "Downloading NirCmd..."
    try {
        Invoke-WebRequest -Uri $nircmdUrl -OutFile $zipFile -UseBasicParsing
        Write-Host "Download complete. Extracting..."
        
        # Extract zip file
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        [System.IO.Compression.ZipFile]::ExtractToDirectory($zipFile, $PSScriptRoot)
        
        # Clean up zip file
        Remove-Item $zipFile
        
        Write-Host "NirCmd setup complete!"
    } catch {
        Write-Host "Download failed: $_"
        Write-Host "Please manually download from: https://www.nirsoft.net/utils/nircmd.html"
        Write-Host "Extract nircmd.exe to: $PSScriptRoot"
    }
}

if (Test-Path $nircmdExe) {
    Write-Host ""
    Write-Host "NirCmd is ready! You can now use switch_resolution.bat"
} else {
    Write-Host ""
    Write-Host "NirCmd not found. Please download manually."
}

