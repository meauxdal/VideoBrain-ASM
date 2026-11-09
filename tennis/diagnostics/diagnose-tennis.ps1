param(
    [string]$Dasm = (Join-Path (Split-Path (Split-Path $PSScriptRoot -Parent) -Parent) 'tools\dasm.exe'),
    [string]$CoreRoot = (Join-Path (Split-Path (Split-Path (Split-Path $PSScriptRoot -Parent) -Parent) -Parent) 'VideoBrain_MiSTer'),
    [string]$Simulator,
    [string]$Container,
    [ValidateRange(80, 1000)][int]$Frames = 120,
    [ValidateRange(1, 180)][int]$Minutes = 45,
    [ValidateSet('paddles', 'rally')][string]$Scenario = 'paddles'
)

# Assembles tennis/candidate.asm and runs it in the VideoBrain_MiSTer headless
# Verilator simulator. The core supplies only the simulator, BIOS and vbc.py;
# outputs go to VideoBrain-ASM/local/tennis/diagnostic-<stamp>.
$ErrorActionPreference = 'Stop'
$tennis = Split-Path $PSScriptRoot -Parent
$asmRoot = Split-Path $tennis -Parent
$core = (Resolve-Path -LiteralPath $CoreRoot).Path
$local = Join-Path $asmRoot 'local/tennis'
if (!$Simulator) { $Simulator = Join-Path $core 'local/tools/verilator-headless/Vtop' }
if (!$Container) { $Container = Join-Path $local 'tennis-adaptation-v4.vbc' }
foreach ($file in @($Dasm, $Simulator, $Container, (Join-Path $tennis 'candidate.asm'))) {
    if (!(Test-Path -LiteralPath $file -PathType Leaf)) { throw "Missing file: $file" }
}
$output = Join-Path $local ('diagnostic-' + (Get-Date -Format 'yyyyMMdd-HHmmss-fff'))
New-Item -ItemType Directory -Path $output | Out-Null
$rom = Join-Path $output 'candidate.bin'
$symbols = Join-Path $output 'candidate.sym'
& $Dasm (Join-Path $tennis 'candidate.asm') '-f3' "-I$tennis" `
    "-o$rom" "-s$symbols" '-R' 1> (Join-Path $output 'assembly.log') 2> (Join-Path $output 'assembly.err')
if ($LASTEXITCODE -ne 0) { throw "Assembly failed. See $output" }

function ConvertTo-WslPath([string]$Path) {
    $resolved = (Resolve-Path -LiteralPath $Path).Path.Replace('\', '/')
    if ($resolved -notmatch '^([A-Za-z]):/(.*)$') { throw "Expected a drive path: $resolved" }
    '/mnt/' + $Matches[1].ToLowerInvariant() + '/' + $Matches[2]
}

Write-Output "Results: $output"
Write-Output "Limit: $Minutes minutes; $Frames fields. Partial results survive timeout."
& wsl --exec python3 -B (ConvertTo-WslPath (Join-Path $PSScriptRoot 'diagnose_tennis.py')) `
    --core-root (ConvertTo-WslPath $core) `
    --sim (ConvertTo-WslPath $Simulator) --rom (ConvertTo-WslPath $rom) `
    --symbols (ConvertTo-WslPath $symbols) --out (ConvertTo-WslPath $output) `
    --container (ConvertTo-WslPath $Container) `
    --frames $Frames --minutes $Minutes --scenario $Scenario
if ($LASTEXITCODE -ne 0) { throw "Diagnostic incomplete or failed (exit $LASTEXITCODE). See $output/summary.json" }
