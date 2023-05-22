#Requires -Version 5.1

# Project Paths
$ProjectPath = $MyInvocation.MyCommand.Path | Split-Path -Parent
$ModuleFile = Get-ChildItem -Path $(Join-Path -Path $ProjectPath -ChildPath "NinjaRmmCli") -Filter "*.psm1"
$DistFolder = "Output"

# Setup Build Folders
if (-not $(Test-Path -Path $(Join-Path -Path $ProjectPath -ChildPath $DistFolder) -ErrorAction SilentlyContinue)) {
    New-Item -Path $ProjectPath -Name $DistFolder -ItemType Directory -ErrorAction Stop
}

$PublicCmdlets = [System.Collections.Generic.List[String]]::new()

Get-ChildItem -Path $(Join-Path -Path $ProjectPath -ChildPath "NinjaRmmCli") -Recurse -Filter "*.ps1" | ForEach-Object -Process {
    if ($_.FullName -like "*public*") {
        $PublicCmdlets.Add($_)
    }
    $_ | Get-Content
} -End {
    $Aliases = @(
        "Ninja-Property-Clear",
        "Ninja-Property-Docs-Get",
        "Ninja-Property-Docs-Get-Single",
        "Ninja-Property-Docs-Names",
        "Ninja-Property-Options",
        "Ninja-Property-Get",
        "Ninja-Property-Docs-Templates",
        "Ninja-Property-Docs-Set",
        "Ninja-Property-Docs-Set-Single",
        "Ninja-Property-Set"
    ) -join ", "
    "# Remove Ninja's module before exporting our functions and alias's"
    'if ($(Get-Module -Name "NJCliPsh")) { Get-Module -Name "NJCliPsh" | Remove-Module -Force -Confirm:$false }'
    'elseif ($(Get-Module -Name "NJCliPsh" -ListAvailable)) { Get-Module -Name "NJCliPsh" -ListAvailable | Remove-Module -Force -Confirm:$false }'
    ''
    "Export-ModuleMember -Cmdlet $($PublicCmdlets -replace ".ps1" -join ', ') -Alias $Aliases"
} | Set-Content -Path $(Join-Path -Path $(Join-Path -Path $ProjectPath -ChildPath $DistFolder) -ChildPath $ModuleFile.Name)
