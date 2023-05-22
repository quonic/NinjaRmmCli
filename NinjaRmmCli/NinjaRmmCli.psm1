[cmdletbinding()]
param()
Write-Verbose "This psm1 is replaced in the build output. This file is only used for debugging."
Write-Verbose $PSScriptRoot

Write-Verbose 'Import everything in sub folders'
'private', 'public' | ForEach-Object {
    $Folder = $_
    $root = Join-Path -Path $PSScriptRoot -ChildPath $Folder
    if (Test-Path -Path $root) {
        Write-Verbose "Processing folder $root"
        $files = Get-ChildItem -Path $root -Filter "*.ps1" -Recurse

        # dot source each file
        $files | where-Object { $_.name -NotLike '*.Tests.ps1' } |
        ForEach-Object { Write-Verbose $_.basename; . $_.FullName }
    }
}

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
)
if ($(Get-Module -Name "NJCliPsh")) {
    Get-Module -Name "NJCliPsh" | Remove-Module -Force -Confirm:$false
}
elseif ($(Get-Module -Name "NJCliPsh" -ListAvailable)) {
    Get-Module -Name "NJCliPsh" -ListAvailable | Remove-Module -Force -Confirm:$false
}
Export-ModuleMember -Function (Get-ChildItem -Path "$PSScriptRoot\public\*.ps1").BaseName -Alias $Aliases