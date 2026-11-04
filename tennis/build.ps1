param(
    [Parameter(Mandatory = $true)][string]$Dasm
)

$ErrorActionPreference = 'Stop'
$assembler = (Resolve-Path -LiteralPath $Dasm).Path
$source = Join-Path $PSScriptRoot 'tennis.asm'
$root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent
$output = Join-Path $root 'local/tennis-adaptation'
New-Item -ItemType Directory -Force -Path $output | Out-Null
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss-fff'

$variants = @('retail', 'tennis-patent-upper-line-v1', 'tennis-patent-court-v2')
for ($mode = 0; $mode -lt $variants.Count; $mode++) {
    $variant = $variants[$mode]
    $binary = Join-Path $output "$variant.bin"
    $log = Join-Path $output "$variant-$stamp.log"
    $errors = Join-Path $output "$variant-$stamp.err"
    & $assembler $source '-f3' "-I$PSScriptRoot" "-DPATENT_COURT=$mode" "-o$binary" `
        "-l$(Join-Path $output "$variant.lst")" `
        "-s$(Join-Path $output "$variant.sym")" '-R' 1> $log 2> $errors
    if ($LASTEXITCODE -ne 0) {
        throw "Assembly failed: $log; $errors"
    }
    Write-Output "Assembly log: $log"
    Write-Output "Assembly errors: $errors"
}

$baselinePath = Join-Path $output 'retail.bin'
$candidatePath = Join-Path $output 'tennis-patent-court-v2.bin'
$baselineHash = (Get-FileHash -LiteralPath $baselinePath -Algorithm SHA256).Hash.ToLowerInvariant()
if ($baselineHash -ne '4d8bafbffb31ab25532d493a0cba313eaa61a94d5f81e6b7f27cf8d881c85ccc') {
    throw 'Baseline does not match the retail cartridge.'
}
[byte[]]$baseline = [System.IO.File]::ReadAllBytes($baselinePath)
[byte[]]$expected = $baseline.Clone()
[byte[]]$actual = [System.IO.File]::ReadAllBytes($candidatePath)
$firstGraftPath = Join-Path $output 'tennis-patent-upper-line-v1.bin'
if ((Get-FileHash -LiteralPath $firstGraftPath -Algorithm SHA256).Hash.ToLowerInvariant() -ne `
    'c2b7b15db789ed48f1a0c59afb25a08d5ce36ac09de070132e5a6a038ee1c41d') {
    throw 'First graft changed unexpectedly.'
}
$changes = @{
    0xe11 = 0x5d; 0xe12 = 0x34
    0xe17 = 0x5d; 0xe18 = 0xec
    0xe1d = 0x61; 0xe1e = 0x54
    0xe23 = 0x61; 0xe24 = 0x90
    0xe27 = 0x3c; 0xe29 = 0x61; 0xe2a = 0xcc
    0xe4d = 0x8f
}
foreach ($offset in $changes.Keys) { $expected[$offset] = $changes[$offset] }
if ($actual.Length -ne 4096) { throw 'Candidate must be 4096 bytes.' }
for ($i = 0; $i -lt $expected.Length; $i++) {
    if ($actual[$i] -ne $expected[$i]) {
        throw ('Unexpected candidate byte at ${0:X4}.' -f (0x1000 + $i))
    }
}

# Verify actual ROM records after the retail center-to-origin conversion.
$geometry = @(
    @(7, 1, 50, 23, 4),
    @(8, 1, 234, 23, 4),
    @(9, 93, 54, 1, 60),
    @(10, 93, 114, 1, 60),
    @(11, 93, 174, 1, 60)
)
foreach ($record in $geometry) {
    $offset = 0xde5 + 6 * $record[0]
    $height = [int]$actual[$offset]
    $width = $actual[$offset + 1] -band 31
    $x = ($actual[$offset + 2] - 4 * $width) -band 255
    $y = ($actual[$offset + 3] - [int][Math]::Floor($height / 2)) -band 255
    if ($x -ne $record[1] -or $y -ne $record[2] -or
        $width -ne $record[3] -or $height -ne $record[4]) {
        throw "Incorrect geometry for retail object $($record[0])."
    }
}
$candidateHash = (Get-FileHash -LiteralPath $candidatePath -Algorithm SHA256).Hash.ToLowerInvariant()
$verification = Join-Path $output "verification-$stamp.log"
@(
    "Retail: 4096 bytes, SHA256 $baselineHash"
    'First graft: SHA256 preserved.'
    "Candidate: exactly $($changes.Count) changed data bytes; all instruction bytes preserved."
    "Candidate SHA256: $candidateHash"
    'Upper/lower lines: x=1, y=50/234, width=184 pixels, height=4 scanlines.'
    'Net: x=93, y=54/114/174, width=8 pixels, height=60 scanlines each.'
    'Ball boundary region: Y center 141->143; half-height remains 85.'
    'Player movement records and input conversion unchanged.'
    'V2 hardware and simulator validation pending.'
) | Tee-Object -FilePath $verification
Write-Output "ROM: $candidatePath"
Write-Output "Verification log: $verification"
