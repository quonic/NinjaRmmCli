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
        $Arguments = [System.Collections.Generic.List[string]]::new()
        $Arguments.Add("get")
        if ($DocumentName) {
            $Arguments.Add($TemplateId)
            $Arguments.Add("""$DocumentName""")
        }
        else {
            $Arguments.Add("""$TemplateId""")
        }
        $Arguments.Add($AttributeName)
        if ($PSCmdlet.ShouldProcess("Invoke-NinjaCli")) {
            Invoke-NinjaCli -Arguments $Arguments
        }
        else {
            Invoke-NinjaCli -Arguments $Arguments
        }
    }
}