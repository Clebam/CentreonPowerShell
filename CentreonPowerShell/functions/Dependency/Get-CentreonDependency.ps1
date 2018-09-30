<#
    .SYNOPSIS
        Returns a list of dependencies
    .DESCRIPTION
        Returns a list of dependencies
    .PARAMETER Filter
        Simple string filter. No Regex (Beware, foo will return foo1, foo2, foo3)
    .EXAMPLE
        Get-CentreonDependency

        Returns all the dependencies in Centreon
    .EXAMPLE
        Get-CentreonDependency -Filter "my dependency"

        Returns the instances with "my depenency" in their name
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonDependency {
    [CmdletBinding()]
    param (
        [string] $Filter
    )
    if ($Filter) {
        Invoke-Centreon -Object DEP -Action SHOW -Value $Filter | Select-Object @{Name = "Instance"; Expression = {$_.Name}}, * -ExcludeProperty Name
    }
    else {
        Invoke-Centreon -Object DEP -Action SHOW | Select-Object @{Name = "Dependency"; Expression = {$_.Name}}, * -ExcludeProperty Name
    }
}