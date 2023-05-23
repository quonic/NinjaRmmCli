function Get-NinjaDocumentName {
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([string[]])]
    param(
        [Parameter(Mandatory = $false)]
        [string]
        $TemplateId
    )
    process {
        $Arguments = $(
            "documents"
            if ($Name) {
                $TemplateId
            }
        )
        if ($PSCmdlet.ShouldProcess("Invoke-NinjaCli")) {
            Invoke-NinjaCli -Arguments $Arguments
        }
        else {
            Invoke-NinjaCli -Arguments $Arguments -WhatIf
        }
    }
}