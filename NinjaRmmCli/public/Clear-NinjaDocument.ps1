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
        [Parameter(Mandatory = $true)]
        [Alias("Document")]
        [string]
        $DocumentName
    )
    process {
        $Arguments = [System.Collections.Generic.List[string]]::new()
        $Arguments.Add("org-clear")
        $Arguments.Add($TemplateId)
        $Arguments.Add("""$DocumentName""")
        $Arguments.Add("""$AttributeName""")
        if ($PSCmdlet.ShouldProcess("Invoke-NinjaCli")) {
            Invoke-NinjaCli -Arguments $Arguments
        }
        else {
            Invoke-NinjaCli -Arguments $Arguments -WhatIf
        }
    }
}