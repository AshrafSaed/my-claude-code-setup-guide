# Installs the 5 power commands (ooda, ghost, l99, artifacts, godmode) for Claude Code.
# Source: https://github.com/AshrafSaed/my-claude-code-setup-guide  (folder "5-power-commands")
$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$base = 'https://raw.githubusercontent.com/AshrafSaed/my-claude-code-setup-guide/main/5-power-commands/claude-code/commands'
$target = Join-Path $env:USERPROFILE '.claude\commands'
New-Item -ItemType Directory -Force -Path $target | Out-Null
foreach ($name in 'ooda','ghost','l99','artifacts','godmode') {
    Invoke-WebRequest -UseBasicParsing -Uri "$base/$name.md" -OutFile (Join-Path $target "$name.md")
    Write-Host "Installed /$name"
}
Write-Host "Done. Restart Claude Code. Files are in: $target"
Get-ChildItem $target | Select-Object Name, Length
