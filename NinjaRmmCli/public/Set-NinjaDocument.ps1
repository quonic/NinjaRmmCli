function Set-NinjaDocument {
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
        $DocumentName,
        [Parameter(Mandatory = $true)]
        [string]
        $Value
    )
    process {
        $Arguments = $(
            "--direct-out"
            "org-set"
            if ($DocumentName) {
                $TemplateId
                """$DocumentName"""
            }
            else {
                """$TemplateId"""
            }
            $AttributeName
            """$Value"""
        )
        
        if ($PSCmdlet.ShouldProcess("Invoke-NinjaCli")) {
            Invoke-NinjaCli -Arguments $Arguments
        }
        else {
            Invoke-NinjaCli -Arguments $Arguments -WhatIf
        }
    }
}