<#
    .SYNOPSIS
        Creates a new hostgroup
    .DESCRIPTION
        Creates a new hostgroup
    .PARAMETER Name
        Corresponds to the hostgroup name
    .PARAMETER Name
        Corresponds to the hostgroup description (Alias)
    .EXAMPLE
        New-CentreonHostGroup -Name "Mamoudzou_Servers" -Description "Servers located in Mamoudzou"
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function New-CentreonHostGroup {
    param (
        [string] $Name,
        [string] $Description
    )
    $Value = "$Description;$Name"
    Invoke-Centreon -CentreonSession $CentreonSession -Object HG -Action ADD -Value $Value
}