param(
    [Parameter(Mandatory = $true)][string]$Dasm
)

$ErrorActionPreference = 'Stop'
$assembler = (Resolve-Path -LiteralPath $Dasm).Path
$root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent
$output = Join-Path $root 'local/tennis-adaptation'
$retail = Join-Path $root 'software/1 Cartridges/Tennis (EN03) (USA) (1978.11.07).bin'
if ((Get-FileHash -LiteralPath $retail -Algorithm SHA256).Hash.ToLowerInvariant() -ne
    '4d8bafbffb31ab25532d493a0cba313eaa61a94d5f81e6b7f27cf8d881c85ccc') {
    throw 'Reference does not match the retail cartridge.'
}
New-Item -ItemType Directory -Force -Path $output | Out-Null
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss-fff'
$binary = Join-Path $output 'controls-unit.bin'
$symbols = Join-Path $output 'controls-unit.sym'
$assemblyLog = Join-Path $output "controls-assembly-$stamp.log"
$assemblyErrors = Join-Path $output "controls-assembly-$stamp.err"
$checkLog = Join-Path $output "controls-check-$stamp.log"
$checkErrors = Join-Path $output "controls-check-$stamp.err"
& $assembler (Join-Path $PSScriptRoot 'tests/controls-fixture.asm') '-f3' `
    "-I$PSScriptRoot" "-o$binary" "-s$symbols" `
    "-l$(Join-Path $output 'controls-unit.lst')" '-R' 1> $assemblyLog 2> $assemblyErrors
if ($LASTEXITCODE -ne 0) { throw "Assembly failed: $assemblyLog; $assemblyErrors" }
& node (Join-Path $PSScriptRoot 'tests/check-controls.cjs') $binary $symbols $retail 1> $checkLog 2> $checkErrors
if ($LASTEXITCODE -ne 0) { throw "Control checks failed: $checkLog; $checkErrors" }
Get-Content -LiteralPath $checkLog
Write-Output "Assembly log: $assemblyLog"
Write-Output "Assembly errors: $assemblyErrors"
Write-Output "Check log: $checkLog"
Write-Output "Check errors: $checkErrors"
