# Storyflow APK Rebuild and Sign Script
# This script automates rebuilding, aligning, and signing the decompiled APK.

$ErrorActionPreference = "Stop"

$workspaceDir = $PSScriptRoot
Set-Location $workspaceDir

# 1. Paths to tools
$buildToolsDir = "C:\Users\SteamDeck\AppData\Local\Android\Sdk\build-tools"
if (-not (Test-Path $buildToolsDir)) {
    Write-Error "Android SDK Build Tools directory not found at $buildToolsDir. Please make sure Android SDK is installed."
}

# Find the latest build-tools version
$latestVersion = Get-ChildItem -Path $buildToolsDir | Where-Object { $_.PSIsContainer } | Sort-Object Name -Descending | Select-Object -First 1
if ($null -eq $latestVersion) {
    Write-Error "No build-tools versions found in $buildToolsDir"
}

$zipalign = Join-Path $latestVersion.FullName "zipalign.exe"
$apksigner = Join-Path $latestVersion.FullName "apksigner.bat"

Write-Host "Using Build-Tools version: $($latestVersion.Name)"
Write-Host "zipalign path: $zipalign"
Write-Host "apksigner path: $apksigner"

# Create output directory
$distDir = Join-Path $workspaceDir "dist"
if (-not (Test-Path $distDir)) {
    New-Item -ItemType Directory -Path $distDir | Out-Null
}

$unalignedApk = Join-Path $distDir "storyflow_unaligned.apk"
$alignedApk = Join-Path $distDir "storyflow_aligned.apk"
$signedApk = Join-Path $distDir "storyflow_signed.apk"

# 2. Rebuild the APK using Apktool
Write-Host "`n[1/4] Rebuilding APK with Apktool..." -ForegroundColor Cyan
java -jar apktool.jar b . -o $unalignedApk

# 3. Align the APK using zipalign
Write-Host "`n[2/4] Aligning APK with zipalign..." -ForegroundColor Cyan
if (Test-Path $alignedApk) {
    Remove-Item $alignedApk -Force
}
& $zipalign -v 4 $unalignedApk $alignedApk

# 4. Generate keystore if not exists
$keystore = Join-Path $workspaceDir "storyflow.keystore"
if (-not (Test-Path $keystore)) {
    Write-Host "`n[3/4] Generating signing key (keystore)..." -ForegroundColor Cyan
    keytool -genkeypair -v -keystore $keystore -alias storyflow -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Storyflow, O=Storyflow, C=US" -storepass android -keypass android
} else {
    Write-Host "`n[3/4] Using existing signing key..." -ForegroundColor Cyan
}

# 5. Sign the APK using apksigner
Write-Host "`n[4/4] Signing APK with apksigner..." -ForegroundColor Cyan
if (Test-Path $signedApk) {
    Remove-Item $signedApk -Force
}
& $apksigner sign --ks $keystore --ks-key-alias storyflow --ks-pass pass:android --key-pass pass:android --out $signedApk $alignedApk

Write-Host "`n==========================================" -ForegroundColor Green
Write-Host "Success! The programmable APK has been rebuilt and signed." -ForegroundColor Green
Write-Host "Output File: $signedApk" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green
