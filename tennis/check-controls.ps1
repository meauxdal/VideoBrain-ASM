param(
    [Parameter(Mandatory = $true)][string]$Dasm,
    [string]$NodeExe = 'node',
    [string]$CoreRoot = (Join-Path (Split-Path (Split-Path $PSScriptRoot -Parent) -Parent) 'VideoBrain_MiSTer')
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $CoreRoot).Path
$assembler = (Resolve-Path -LiteralPath $Dasm).Path
$nodeCommand = Get-Command -Name $NodeExe -CommandType Application -ErrorAction SilentlyContinue
if (!$nodeCommand) { throw 'Node.js was not found. Pass -NodeExe <path-to-node.exe>.' }
$nodePath = $nodeCommand.Source
$output = Join-Path (Split-Path $PSScriptRoot -Parent) 'local/tennis'
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
& $nodePath (Join-Path $PSScriptRoot 'tests/check-controls.cjs') $binary $symbols $retail 1> $checkLog 2> $checkErrors
if ($LASTEXITCODE -ne 0) { throw "Control checks failed: $checkLog; $checkErrors" }
Get-Content -LiteralPath $checkLog
Write-Output "Assembly log: $assemblyLog"
Write-Output "Assembly errors: $assemblyErrors"
Write-Output "Check log: $checkLog"
Write-Output "Check errors: $checkErrors"
