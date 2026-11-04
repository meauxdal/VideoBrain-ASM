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
$binary = Join-Path $output 'rally-unit.bin'
$symbols = Join-Path $output 'rally-unit.sym'
$assemblyLog = Join-Path $output "rally-assembly-$stamp.log"
$assemblyErrors = Join-Path $output "rally-assembly-$stamp.err"
$checkLog = Join-Path $output "rally-check-$stamp.log"
$checkErrors = Join-Path $output "rally-check-$stamp.err"
& $assembler (Join-Path $PSScriptRoot 'tests/rally-fixture.asm') '-f3' `
    "-I$PSScriptRoot" "-o$binary" "-s$symbols" `
    "-l$(Join-Path $output 'rally-unit.lst')" '-R' 1> $assemblyLog 2> $assemblyErrors
if ($LASTEXITCODE -ne 0) { throw "Assembly failed: $assemblyLog; $assemblyErrors" }
& node (Join-Path $PSScriptRoot 'tests/check-rally.cjs') $binary $symbols 1> $checkLog 2> $checkErrors
if ($LASTEXITCODE -ne 0) { throw "Rally checks failed: $checkLog; $checkErrors" }
Get-Content -LiteralPath $checkLog
Write-Output "Assembly log: $assemblyLog"
Write-Output "Assembly errors: $assemblyErrors"
Write-Output "Check log: $checkLog"
Write-Output "Check errors: $checkErrors"
