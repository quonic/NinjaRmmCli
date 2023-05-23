function Get-NinjaDocument {
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([string[]])]
    param(
        [Parameter(Mandatory = $true)]
        [Alias("Template")]
        [Alias("Id")]
        [string]
        $TemplateId,
        [Parameter(Mandatory = $true)]
        [Alias("Attribute")]
        [string]
        $AttributeName,
        [Parameter(Mandatory = $false)]
        [Alias("Document")]
        [string]
        $DocumentName
    )
    process {
        $Arguments = $(
            "org-options"
            $TemplateId
            """$DocumentName"""
            """$AttributeName"""
        )
        if ($PSCmdlet.ShouldProcess("Invoke-NinjaCli")) {
            Invoke-NinjaCli -Arguments $Arguments
        }
        else {
            Invoke-NinjaCli -Arguments $Arguments -WhatIf
        }
    }
}