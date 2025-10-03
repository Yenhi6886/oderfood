# Script to uncomment all Java files and commit each one

# Get all Java files that start with //package
$files = Get-ChildItem -Path "src\main\java" -Filter "*.java" -Recurse | Where-Object {
    $content = Get-Content $_.FullName -Raw
    $content -match "^//package com\.example"
}

Write-Host "Found $($files.Count) files to uncomment"

foreach ($file in $files) {
    Write-Host "`nProcessing $($file.Name)..."
    
    # Read file content
    $content = Get-Content $file.FullName -Raw
    
    # Uncomment all lines starting with //
    $newContent = $content -replace "(?m)^//", ""
    
    # Write back to file
    Set-Content -Path $file.FullName -Value $newContent -NoNewline
    
    # Get relative path for git
    $relativePath = $file.FullName.Replace((Get-Location).Path + "\", "").Replace("\", "/")
    
    # Git add and commit
    git add $relativePath
    $commitMsg = "Uncomment $($file.BaseName)"
    git commit -m $commitMsg
    
    Write-Host "Committed: $commitMsg"
}

Write-Host "`nDone! Uncommented and committed $($files.Count) files."
