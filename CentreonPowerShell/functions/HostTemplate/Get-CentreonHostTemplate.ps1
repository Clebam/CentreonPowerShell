<#
    .SYNOPSIS
        Returns a list of host templates
    .DESCRIPTION
        Returns a list of host templates
    .PARAMETER Filter
        Simple string filter. No Regex (Beware, foo will return foo1, foo2, foo3)
    .EXAMPLE
        Get-CentreonHostTemplate

        Returns all the host templates of Centreon
    .EXAMPLE
        Get-CentreonHostTemplate -Filter "Web"

        Returns the host templates with "Web" in their names
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostTemplate {
    [CmdletBinding()]
    param (
        [string] $Filter
    )

    if ($Filter) {        
        Invoke-Centreon -Object HTPL -Action SHOW -Value $Filter | Select-Object @{Name="HostTemplate";Expression={$_.Name}},* -ExcludeProperty Name
    }
    else {      
        Invoke-Centreon -Object HTPL -Action SHOW | Select-Object @{Name="HostTemplate";Expression={$_.Name}},* -ExcludeProperty Name
    }
}