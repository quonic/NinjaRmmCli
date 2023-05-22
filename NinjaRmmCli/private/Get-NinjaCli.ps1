function Get-NinjaCli {
    [CmdletBinding()]
    [OutputType([string])]
    param()
    process {
        if ($IsLinux) { "/opt/NinjaRMMAgent/programdata/ninjarmm-cli" }
        elseif ($IsMacOS) { "/Applications/NinjaRMMAgent/programdata/ninjarmm-cli" }
        else {
            if ($(Test-Path -Path Env:\NINJARMMCLI)) { Get-Item Env:\NINJARMMCLI | Select-Object -ExpandProperty Value }
            else { "C:\ProgramData\NinjaRMMAgent\ninjarmm-cli.exe" }
        }
    }
}