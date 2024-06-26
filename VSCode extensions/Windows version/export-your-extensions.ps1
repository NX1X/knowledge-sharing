$outputFile = "VSCode-Extensions-With-Urls.txt"

if (Test-Path $outputFile) {
    Clear-Content $outputFile
} else {
    New-Item $outputFile -ItemType File
}

$extensions = code --list-extensions

foreach ($ext in $extensions) {
    $extensionName = $ext -split '\.', 2 | Select-Object -Last 1

    $title = $extensionName -replace '-', ' ' -split ' ' | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1).ToLower() }
    $title = $title -join ' '

    $url = "https://marketplace.visualstudio.com/items?itemName=$ext"

    Add-Content -Path $outputFile -Value "${title}`r`n${url}`r`n"
}

Write-Host "Export completed. Check the $outputFile file."



