<#
    .SYNOPSIS
        Saves credentials in config.json
    .DESCRIPTION
        Saves credentials in config.json
    .PARAMETER UserName
        Login of an admin account of centreon
    .PARAMETER Password
        Password of an admin account of centreon
    .EXAMPLE
        Set-CentreonCredential -UserName admin -Password centreon
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonCredential {
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $UserName,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Password
    )
    $ModuleDirectory = (Get-Module CentreonModule).ModuleBase
    $ConfigFilePath = Join-Path -Path $ModuleDirectory -ChildPath "Config\Config.json"
    $ConfigFile = Get-Content -Raw -Path $ConfigFilePath
    $ConfigObject = ConvertFrom-Json $ConfigFile
    $ConfigObject.UserName = $UserName
    $ConfigObject.Password = $Password
    $ConfigObject | ConvertTo-Json | Set-Content $ConfigFilePath -Force
}