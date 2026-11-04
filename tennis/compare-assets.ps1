param(
    [Parameter(Mandatory = $true)][string]$RetailRom,
    [Parameter(Mandatory = $true)][string]$PatentArchive,
    [Parameter(Mandatory = $true)][string]$AdamArchive,
    [string]$CoreRoot = (Join-Path (Split-Path (Split-Path $PSScriptRoot -Parent) -Parent) 'VideoBrain_MiSTer')
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $CoreRoot).Path
Add-Type -AssemblyName System.IO.Compression.FileSystem

function Read-Entry($Archive, [string]$Name) {
    $entry = $Archive.GetEntry($Name)
    if ($null -eq $entry) { throw "Missing archive entry: $Name" }
    $stream = $entry.Open()
    $memory = [System.IO.MemoryStream]::new()
    try {
        $stream.CopyTo($memory)
        return ,$memory.ToArray()
    } finally {
        $memory.Dispose()
        $stream.Dispose()
    }
}

if ((Get-FileHash -LiteralPath $RetailRom -Algorithm SHA256).Hash.ToLowerInvariant() -ne
    '4d8bafbffb31ab25532d493a0cba313eaa61a94d5f81e6b7f27cf8d881c85ccc') {
    throw 'Expected the original retail Tennis EN03 cartridge.'
}
$retail = [System.IO.File]::ReadAllBytes((Resolve-Path -LiteralPath $RetailRom))
$patentZip = [System.IO.Compression.ZipFile]::OpenRead((Resolve-Path -LiteralPath $PatentArchive))
$adamZip = [System.IO.Compression.ZipFile]::OpenRead((Resolve-Path -LiteralPath $AdamArchive))
try {
    $patent = Read-Entry $patentZip 'US4232374 data $1200.bin'
    $adam = Read-Entry $adamZip 'tennisadam.bin'
    $symbolText = [System.Text.Encoding]::ASCII.GetString((Read-Entry $adamZip 'tennisadam.sym'))
    $patentSource = [System.Text.Encoding]::ASCII.GetString((Read-Entry $patentZip 'prototennis.asm'))
    $adamSource = [System.Text.Encoding]::ASCII.GetString((Read-Entry $adamZip 'TennisAdam.f8'))
} finally {
    $patentZip.Dispose()
    $adamZip.Dispose()
}
if ($patent.Length -ne 1301 -or $adam.Length -ne 4096) { throw 'Unexpected reconstruction size.' }

$symbols = @{}
foreach ($line in ($symbolText -split "`n")) {
    $row = [regex]::Match($line, '^(\w+)\s+([0-9a-f]{4})\b', 'IgnoreCase')
    if ($row.Success) { $symbols[$row.Groups[1].Value] = [Convert]::ToInt32($row.Groups[2].Value, 16) }
}
$lengths = [ordered]@{
    DIGS = 70; BL = 6; BR = 6
    LP1O = 32; LP1E = 32; LP2O = 64; LP2E = 64
    RP1O = 32; RP1E = 32; RP2O = 64; RP2E = 64
    NL = 60; NR = 60; CB = 4
    LB1O = 64; LB1E = 64; LB2O = 64; LB2E = 64
    RB1O = 64; RB1E = 64; RB2O = 64; RB2E = 64
    CR1O = 12; CR1E = 12; CR2O = 12; CR2E = 12
}
$assets = foreach ($name in $lengths.Keys) {
    if (-not $symbols.ContainsKey($name)) { throw "Missing asset symbol: $name" }
    $address = $symbols[$name]
    $length = $lengths[$name]
    $offset = $address - 0x1200
    if ($offset -lt 0 -or $offset + $length -gt $patent.Length) { throw "Invalid asset range: $name" }
    $disagreements = @(
        for ($i = 0; $i -lt $length; $i++) {
            if ($patent[$offset + $i] -ne $adam[$address - 0x1000 + $i]) { '{0:X4}' -f ($address + $i) }
        }
    )
    $locations = [System.Collections.Generic.List[string]]::new()
    for ($start = 0; $start + $length -le $retail.Length; $start++) {
        if ($retail[$start] -ne $patent[$offset]) { continue }
        $same = $true
        for ($i = 1; $i -lt $length; $i++) {
            if ($retail[$start + $i] -ne $patent[$offset + $i]) { $same = $false; break }
        }
        if ($same) { $locations.Add(('{0:X4}' -f (0x1000 + $start))) }
    }
    [pscustomobject]@{
        Name = $name; Address = '{0:X4}' -f $address; Bytes = $length
        AdamDifferences = $disagreements; RetailMatches = $locations.ToArray()
    }
}
$dataDifferences = @(
    for ($i = 0; $i -lt $patent.Length; $i++) {
        if ($patent[$i] -ne $adam[$i + 0x200]) {
            [pscustomobject]@{
                Address = '{0:X4}' -f (0x1200 + $i)
                E5frog = '{0:X2}' -f $patent[$i]; Adam = '{0:X2}' -f $adam[$i + 0x200]
            }
        }
    }
)
$guesses = @(
    foreach ($line in ($patentSource -split "`n")) {
        if ($line -notmatch 'guess') { continue }
        $row = [regex]::Match($line, ';\s*([0-9a-f]{4})\s+(.+)', 'IgnoreCase')
        if ($row.Success) { $row.Groups[1].Value.ToUpperInvariant() }
    }
)
$missing = @(
    [regex]::Matches($adamSource, 'Missing line in assembly listing \(\$([0-9a-f]{4})\)', 'IgnoreCase') |
        ForEach-Object { $_.Groups[1].Value.ToUpperInvariant() } | Sort-Object -Unique
)
$output = Join-Path $root 'local/tennis-adaptation'
New-Item -ItemType Directory -Force -Path $output | Out-Null
$report = Join-Path $output ('assets-{0}.json' -f (Get-Date -Format 'yyyyMMdd-HHmmss-fff'))
[ordered]@{
    Assets = @($assets); DataDifferences = $dataDifferences
    E5frogGuessedInstructionSites = $guesses; AdamMissingByteSites = $missing
} | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $report -Encoding ascii
$assets | Select-Object Name, Address, Bytes,
    @{Name = 'AdamDifferences'; Expression = { $_.AdamDifferences -join ',' }},
    @{Name = 'RetailMatches'; Expression = { $_.RetailMatches -join ',' }} | Format-Table -AutoSize
Write-Output "Data disagreements: $($dataDifferences.Count)"
Write-Output "Guessed instruction sites: $($guesses.Count)"
Write-Output "Report: $report"
