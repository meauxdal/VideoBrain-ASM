param(
    [Parameter(Mandatory = $true)][string]$Dasm,
    [string]$CoreRoot = (Join-Path (Split-Path (Split-Path $PSScriptRoot -Parent) -Parent) 'VideoBrain_MiSTer')
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $CoreRoot).Path
$assembler = (Resolve-Path -LiteralPath $Dasm).Path
$output = Join-Path $root 'local/tennis-adaptation'
New-Item -ItemType Directory -Force -Path $output | Out-Null
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss-fff'
$binary = Join-Path $output 'tennis-adaptation.bin'
$symbols = Join-Path $output 'candidate.sym'
$assemblyLog = Join-Path $output "candidate-assembly-$stamp.log"
$assemblyErrors = Join-Path $output "candidate-assembly-$stamp.err"
$checkLog = Join-Path $output "candidate-check-$stamp.log"
$checkErrors = Join-Path $output "candidate-check-$stamp.err"
& $assembler (Join-Path $PSScriptRoot 'candidate.asm') '-f3' `
    "-I$PSScriptRoot" "-o$binary" "-s$symbols" `
    "-l$(Join-Path $output 'candidate.lst')" '-R' 1> $assemblyLog 2> $assemblyErrors
if ($LASTEXITCODE -ne 0) { throw "Assembly failed: $assemblyLog; $assemblyErrors" }
$retail = Join-Path $root 'software/1 Cartridges/Tennis (EN03) (USA) (1978.11.07).bin'
$bios = Join-Path $root 'software/0 BIOS/VideoBrain - RES1 (USA).bin'
& node (Join-Path $PSScriptRoot 'tests/check-candidate.cjs') $binary $symbols $retail $bios 1> $checkLog 2> $checkErrors
if ($LASTEXITCODE -ne 0) { throw "Candidate checks failed: $checkLog; $checkErrors" }
Get-Content -LiteralPath $checkLog
Write-Output "Assembly log: $assemblyLog"
Write-Output "Assembly errors: $assemblyErrors"
Write-Output "Check log: $checkLog"
Write-Output "Check errors: $checkErrors"
Write-Output "Cartridge: $binary"
