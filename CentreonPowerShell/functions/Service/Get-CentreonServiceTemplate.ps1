<#
    .SYNOPSIS
        Returns a list of service templates
    .DESCRIPTION
        Returns a list of service templates
    .PARAMETER Filter
        Simple string filter. No Regex (Beware, foo will return foo1, foo2, foo3)
    .EXAMPLE
        Get-CentreonStpl

        Returns all the service templates of Centreon
    .EXAMPLE
        Get-CentreonStpl -Filter "Web"

        Returns the service templates with "Web" in their names
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonStpl {
    [CmdletBinding()]
    param (
        [string] $Filter
    )
    if ($Filter) {
        Invoke-Centreon -Object STPL -Action SHOW -Value $Filter
    }
    else {
        Invoke-Centreon -Object STPL -Action SHOW
    }
}