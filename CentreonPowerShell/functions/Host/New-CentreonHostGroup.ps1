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

        Creates a new hostgroup name "Mamoudzou_Servers" with its description
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function New-CentreonHostGroup {
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Name,
        [ValidateNotNullOrEmpty()]
        [string] $Description
    )
    $Value = "$Description;$Name"
    Invoke-Centreon -Object HG -Action ADD -Value $Value
}