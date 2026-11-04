param(
    [Parameter(Mandatory = $true)][string]$Dasm
)

$ErrorActionPreference = 'Stop'
$assembler = (Resolve-Path -LiteralPath $Dasm).Path
$output = Join-Path (Split-Path (Split-Path $PSScriptRoot -Parent) -Parent) 'local/tennis-adaptation'
New-Item -ItemType Directory -Force -Path $output | Out-Null
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss-fff'
$binary = Join-Path $output 'paddles-unit.bin'
$symbols = Join-Path $output 'paddles-unit.sym'
$assemblyLog = Join-Path $output "paddles-assembly-$stamp.log"
$assemblyErrors = Join-Path $output "paddles-assembly-$stamp.err"
$checkLog = Join-Path $output "paddles-check-$stamp.log"
$checkErrors = Join-Path $output "paddles-check-$stamp.err"
& $assembler (Join-Path $PSScriptRoot 'tests/paddles-fixture.asm') '-f3' `
    "-I$PSScriptRoot" "-o$binary" "-s$symbols" `
    "-l$(Join-Path $output 'paddles-unit.lst')" '-R' 1> $assemblyLog 2> $assemblyErrors
if ($LASTEXITCODE -ne 0) { throw "Assembly failed: $assemblyLog; $assemblyErrors" }
& node (Join-Path $PSScriptRoot 'tests/check-paddles.cjs') $binary $symbols 1> $checkLog 2> $checkErrors
if ($LASTEXITCODE -ne 0) { throw "Paddle checks failed: $checkLog; $checkErrors" }
Get-Content -LiteralPath $checkLog
Write-Output "Assembly log: $assemblyLog"
Write-Output "Assembly errors: $assemblyErrors"
Write-Output "Check log: $checkLog"
Write-Output "Check errors: $checkErrors"
