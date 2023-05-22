function Get-NinjaDocumentName {
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([string[]])]
    param(
        [Parameter(Mandatory = $false)]
        [string]
        $TemplateId
    )
    process {
        $Arguments = [System.Collections.Generic.List[string]]::new()
        $Arguments.Add("documents")
        if ($Name) {
            $Arguments.Add($TemplateId)
        }
        if ($PSCmdlet.ShouldProcess("Invoke-NinjaCli")) {
            Invoke-NinjaCli -Arguments $Arguments
        }
        else {
            Invoke-NinjaCli -Arguments $Arguments -WhatIf
        }
    }
}