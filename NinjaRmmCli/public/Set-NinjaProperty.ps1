function Set-NinjaProperty {
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([string[]])]
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $Name,
        [Parameter(Mandatory = $true)]
        [PSObject[]]
        $Value
    )
    process {
        $ValueOutput = if ($Value.Count -gt 1) {
            $Value -join ','
        }
        else {
            $Value
        }
        if ($PSCmdlet.ShouldProcess("Invoke-NinjaCli")) {
            Invoke-NinjaCli -Arguments "set", "$Name", """$ValueOutput"""
        }
        else {
            Invoke-NinjaCli -Arguments "set", "$Name", """$ValueOutput""" -WhatIf
        }
    }
}