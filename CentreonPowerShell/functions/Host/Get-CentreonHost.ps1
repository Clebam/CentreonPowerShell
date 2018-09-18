<#
    .SYNOPSIS
        Returns a list of hosts
    .DESCRIPTION
        Returns a list of hosts
    .PARAMETER Filter
        Simple string filter. No Regex (Beware, foo will return foo1, foo2, foo3)
    .EXAMPLE
        Get-CentreonHost

        Returns all the hosts in Centreon
    .EXAMPLE
        Get-CentreonHost -Filter "Web-Mamoudzou"

        Returns the host with "Web-Mamoudzou" in their name
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHost {
    [CmdletBinding()]
    param (
        [string] $Filter
    )
    if ($Filter) {
        Invoke-Centreon -Object HOST -Action SHOW -Value $Filter | Select-Object @{Name = "HostName"; Expression = {$_.Name}}, * -ExcludeProperty Name
    }
    else {
        Invoke-Centreon -Object HOST -Action SHOW | Select-Object @{Name = "HostName"; Expression = {$_.Name}}, * -ExcludeProperty Name
    }
}