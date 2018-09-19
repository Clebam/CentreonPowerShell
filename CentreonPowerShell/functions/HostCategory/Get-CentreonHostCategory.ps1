<#
    .SYNOPSIS
        Returns a list of host categories
    .DESCRIPTION
        Returns a list of host categories
    .PARAMETER Filter
        Simple string filter. No Regex (Beware, foo will return foo1, foo2, foo3)
    .EXAMPLE
        Get-CentreonHostCategory

        Returns all the hosts in Centreon
    .EXAMPLE
        Get-CentreonHostCategory -Filter "Web"

        Returns the host categorie with "Web" in their name
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostCategory {
    [CmdletBinding()]
    param (
        [string] $Filter
    )
    if ($Filter) {
        Invoke-Centreon -Object HC -Action SHOW -Value $Filter | Select-Object @{Name = "HostCategory"; Expression = {$_.Name}}, * -ExcludeProperty Name
    }
    else {
        Invoke-Centreon -Object HC -Action SHOW | Select-Object @{Name = "HostCategory"; Expression = {$_.Name}}, * -ExcludeProperty Name
    }
}