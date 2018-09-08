<#
    .SYNOPSIS
        Returns a list of hosts
    .DESCRIPTION
        Returns a list of hosts
    .PARAMETER Filter
        Simple string filter. No Regex (Beware, foo will return foo1, foo2, foo3)
    .EXAMPLE
        Get-CentreonHost
    .EXAMPLE
        Get-CentreonHost -Filter "Web-Mamoudzou"
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHost {
    param (
        [string] $Filter
    )
    if ($Filter) {
        Invoke-Centreon -Object HOST -Action SHOW -Value $Filter
    }
    else {
        Invoke-Centreon -Object HOST -Action SHOW
    }
}