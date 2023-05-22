function Get-NinjaProperty {
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([string[]])]
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $Name
    )
    process {
        if ($PSCmdlet.ShouldProcess("Invoke-NinjaCli")) {
            Invoke-NinjaCli -Arguments "get", "$Name"
        }
        else {
            Invoke-NinjaCli -Arguments "get", "$Name" -WhatIf
        }
    }
}