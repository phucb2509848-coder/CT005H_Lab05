# Generates binary assets from base64 files and downloads a sample mp4
Param()
$assetsDir = Join-Path $PSScriptRoot "..\assets"
if (-not (Test-Path $assetsDir)) { New-Item -ItemType Directory -Path $assetsDir | Out-Null }

# Decode base64 files
$map = @{ "avatar.b64" = "avatar.png"; "product.b64" = "product.png" }
foreach ($k in $map.Keys) {
    $inFile = Join-Path $assetsDir $k
    $outFile = Join-Path $assetsDir $map[$k]
    if (Test-Path $inFile) {
        Write-Host "Decoding $inFile -> $outFile"
        $b64 = Get-Content $inFile -Raw
        [IO.File]::WriteAllBytes($outFile, [Convert]::FromBase64String($b64))
    } else {
        Write-Warning "$inFile not found"
    }
}

# Download a small sample mp4 for preview
$mp4 = Join-Path $assetsDir "sample.mp4"
if (-not (Test-Path $mp4)) {
    Write-Host "Downloading sample MP4..."
    $url = "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"
    Invoke-WebRequest -Uri $url -OutFile $mp4
} else {
    Write-Host "$mp4 already exists"
}

Write-Host "Assets ready in: $assetsDir"
