<#
    .SYNOPSIS
        Returns a list of host templates
    .DESCRIPTION
        Returns a list of host templates
    .PARAMETER Filter
        Simple string filter. No Regex (Beware, foo will return foo1, foo2, foo3)
    .EXAMPLE
        Get-CentreonHtpl
    .EXAMPLE
        Get-CentreonHtpl -Filter "Web"
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHtpl {
    param (
        [string] $Filter
    )
    if ($Filter) {
        Invoke-Centreon -Object HTPL -Action SHOW -Value $Filter
    }
    else {
        Invoke-Centreon -Object HTPL -Action SHOW
    }
}