# Save this as DiskReport.ps1 and run with PowerShell

$drive = "C:\"
$output = "C:\Users\Krishnadhas N K\Documents\GitHub\devwithkrishna\common-utils\DiskUsageReport.html"
$topN = 50   # Change this to how many folders you want in the report

$results = Get-ChildItem $drive -Directory |
    ForEach-Object {
        $size = (Get-ChildItem $_.FullName -Recurse -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum
        [PSCustomObject]@{
            Folder = $_.FullName
            SizeGB = [math]::Round($size / 1GB, 2)
        }
    } | Sort-Object SizeGB -Descending | Select-Object -First $topN

# Convert to HTML
$results | ConvertTo-Html -Property Folder, SizeGB -Head "<style>body{font-family:Segoe UI;} table{border-collapse:collapse;} th,td{border:1px solid #ddd;padding:8px;} th{background:#0078d7;color:white;}</style>" -Title "Disk Usage Report" |
    Out-File $output

Write-Host "Report generated: $output"
