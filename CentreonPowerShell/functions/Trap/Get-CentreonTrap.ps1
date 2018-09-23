<#
    .SYNOPSIS
        Returns a list of traps
    .DESCRIPTION
        Returns a list of traps
    .PARAMETER Filter
        Simple string filter. No Regex (Beware, foo will return foo1, foo2, foo3)
    .EXAMPLE
        Get-CentreonVendor

        Returns all the traps in Centreon
    .EXAMPLE
        Get-CentreonTraps -Filter "alertSystemUp"

        Returns the traps with "alertSystemUp" in their name
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonTrap {
    [CmdletBinding()]
    param (
        [string] $Filter
    )
    if ($Filter) {
        Invoke-Centreon -Object TRAP -Action SHOW -Value $Filter | Select-Object @{Name = "Trap"; Expression = {$_.Name}}, * -ExcludeProperty Name
    }
    else {
        Invoke-Centreon -Object TRAP -Action SHOW | Select-Object @{Name = "Trap"; Expression = {$_.Name}}, * -ExcludeProperty Name
    }
}