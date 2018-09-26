<#
    .SYNOPSIS
        Returns a list of instances (pollers)
    .DESCRIPTION
        Returns a list of instances (pollers)
    .PARAMETER Filter
        Simple string filter. No Regex (Beware, foo will return foo1, foo2, foo3)
    .EXAMPLE
        Get-CentreonInstance

        Returns all the instances (pollers) in Centreon
    .EXAMPLE
        Get-CentreonInstance -Filter "Central"

        Returns the instances with "Central" in their name
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonInstance {
    [CmdletBinding()]
    param (
        [string] $Filter
    )
    if ($Filter) {
        Invoke-Centreon -Object INSTANCE -Action SHOW -Value $Filter | Select-Object @{Name = "Instance"; Expression = {$_.Name}}, * -ExcludeProperty Name
    }
    else {
        Invoke-Centreon -Object INSTANCE -Action SHOW | Select-Object @{Name = "Instance"; Expression = {$_.Name}}, * -ExcludeProperty Name
    }
}