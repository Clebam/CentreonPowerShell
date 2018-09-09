<#
    .SYNOPSIS
        Returns a list of host templates
    .DESCRIPTION
        Returns a list of host templates
    .PARAMETER Filter
        Simple string filter. No Regex (Beware, foo will return foo1, foo2, foo3)
    .EXAMPLE
        Get-CentreonCommand

        Returns all the commands existing on Centreon
    .EXAMPLE
        Get-CentreonCommand -Filter "Check"

        Returns all the commands with "Check" inside
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonCommand {
    param (
        [string] $Filter
    )
    if ($Filter) {
        Invoke-Centreon -Object CMD -Action SHOW -Value $Filter
    }
    else {
        Invoke-Centreon -Object CMD -Action SHOW
    }
}