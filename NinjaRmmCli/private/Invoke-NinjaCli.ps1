function Invoke-NinjaCli {
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([string[]])]
    param(
        [Parameter(Mandatory = $true)]
        [string[]]
        $Arguments
    )
    process {
        $ArgumentsList = [System.Collections.Generic.List[string]]::new()
        $ArgumentsList.Add("--direct-out")
        $Arguments | ForEach-Object { $ArgumentsList.Add($_) }
        if ($PSCmdlet.ShouldProcess("ninjarmm-cli.exe", "Using Parameters ($($ArgumentsList -join ' '))")) {
            $pinfo = New-Object System.Diagnostics.ProcessStartInfo
            $pinfo.FileName = Get-NinjaCli
            $pinfo.Arguments = $ArgumentsList -join ' '
            $pinfo.RedirectStandardError = $true
            $pinfo.RedirectStandardOutput = $true
            $pinfo.UseShellExecute = $false
            $p = New-Object System.Diagnostics.Process
            $p.StartInfo = $pinfo
            $p.Start() | Out-Null
            $p.WaitForExit()
            $StandardOutput = $p.StandardOutput.ReadToEnd()
            $StandardError = $p.StandardError.ReadToEnd()
            $StandardOutput
            if ($p.ExitCode -eq 1) {
                Write-Error $StandardError
            }
        }
    }
}