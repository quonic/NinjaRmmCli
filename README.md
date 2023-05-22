# NinjaRmmCli

Module for scripts to interact with the Ninja agent's ninjarmm-cli tool.
Should work fine under 5.1+. Untested under older versions of PowerShell.

Replaces:

`Ninja-Property-Clear` with `Clear-NinjaDocument`

`Ninja-Property-Docs-Get` with `Get-NinjaDocument`

`Ninja-Property-Docs-Get-Single` with `Get-NinjaDocument`

`Ninja-Property-Docs-Names` with `Get-NinjaDocumentName`

`Ninja-Property-Options` with `Get-NinjaDocumentOption`

`Ninja-Property-Get` with `Get-NinjaProperty`

`Ninja-Property-Docs-Templates` with `Get-NinjaTemplate`

`Ninja-Property-Docs-Set` with `Set-NinjaDocument`

`Ninja-Property-Docs-Set-Single` with `Set-NinjaDocument`

`Ninja-Property-Set` with `Set-NinjaProperty`

## Install

For all users:

```powershell
Install-Module -Name NinjaRmmCli
```

For Current user:

```powershell
Install-Module -Name NinjaRmmCli -Scope CurrentUser
```
