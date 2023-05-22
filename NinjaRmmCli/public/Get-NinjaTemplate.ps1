function Get-NinjaTemplate {
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([string[]])]
    param()
    process {
        if ($PSCmdlet.ShouldProcess("Invoke-NinjaCli")) {
            Invoke-NinjaCli -Arguments "templates"
        }
        else {
            Invoke-NinjaCli -Arguments "templates" -WhatIf
        }
    }
}