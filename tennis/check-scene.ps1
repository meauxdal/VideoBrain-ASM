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
New-Item -ItemType Directory -Force -Path $output | Out-Null
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss-fff'
$binary = Join-Path $output 'scene-unit.bin'
$symbols = Join-Path $output 'scene-unit.sym'
$assemblyLog = Join-Path $output "scene-assembly-$stamp.log"
$assemblyErrors = Join-Path $output "scene-assembly-$stamp.err"
$checkLog = Join-Path $output "scene-check-$stamp.log"
$checkErrors = Join-Path $output "scene-check-$stamp.err"
& $assembler (Join-Path $PSScriptRoot 'tests/scene-fixture.asm') '-f3' `
    "-I$PSScriptRoot" "-o$binary" "-s$symbols" `
    "-l$(Join-Path $output 'scene-unit.lst')" '-R' 1> $assemblyLog 2> $assemblyErrors
if ($LASTEXITCODE -ne 0) { throw "Assembly failed: $assemblyLog; $assemblyErrors" }
& $nodePath (Join-Path $PSScriptRoot 'tests/check-scene.cjs') $binary $symbols 1> $checkLog 2> $checkErrors
if ($LASTEXITCODE -ne 0) { throw "Scene checks failed: $checkLog; $checkErrors" }
Get-Content -LiteralPath $checkLog
Write-Output "Assembly log: $assemblyLog"
Write-Output "Assembly errors: $assemblyErrors"
Write-Output "Check log: $checkLog"
Write-Output "Check errors: $checkErrors"
