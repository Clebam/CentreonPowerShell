<#
    .SYNOPSIS
        Returns a list of hostgroups
    .DESCRIPTION
        Returns a list of hostgroups
    .PARAMETER Filter
        Simple string filter. No Regex (Beware, foo will return foo1, foo2, foo3)
    .EXAMPLE
        Get-CentreonHost

        Returns all the hostgroups in Centreon
    .EXAMPLE
        Get-CentreonHostGroup -Filter "Web"

        Returns the host with "Web" in their name
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostGroup {
    [CmdletBinding()]
    param (
        [string] $Filter
    )
    if ($Filter) {
        Invoke-Centreon -Object HG -Action SHOW -Value $Filter | Select-Object @{Name = "HostGroup"; Expression = {$_.Name}}, * -ExcludeProperty Name
    }
    else {
        Invoke-Centreon -Object HG -Action SHOW | Select-Object @{Name = "HostGroup"; Expression = {$_.Name}}, * -ExcludeProperty Name
    }
}