<#
    .SYNOPSIS
        Returns a list of host templates
    .DESCRIPTION
        Returns a list of host templates
    .PARAMETER Filter
        Simple string filter. No Regex (Beware, foo will return foo1, foo2, foo3)
    .EXAMPLE
        Get-CentreonServiceTemplate
    .EXAMPLE
        Get-CentreonServiceTemplate -Filter "Web"
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonServiceTemplate {
    param (
        [string] $Filter
    )
    if ($Filter) {
        Invoke-Centreon -CentreonSession $CentreonSession -Object STPL -Action SHOW -Value $Filter
    }
    else {
        Invoke-Centreon -CentreonSession $CentreonSession -Object STPL -Action SHOW
    }
}