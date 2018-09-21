<#
    .SYNOPSIS
        Returns a list of time periods
    .DESCRIPTION
        Returns a list of time periods
    .PARAMETER Filter
        Simple string filter. No Regex (Beware, foo will return foo1, foo2, foo3)
    .EXAMPLE
        Get-CentreonHostTimePeriod

        Returns all the time periods in Centreon
    .EXAMPLE
        Get-CentreonTimePeriod -Filter "work"

        Returns the time periods with "work" in their name
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonTimePeriod {
    [CmdletBinding()]
    param (
        [string] $Filter
    )
    if ($Filter) {
        Invoke-Centreon -Object TP -Action SHOW -Value $Filter | Select-Object @{Name = "TimePeriod"; Expression = {$_.Name}}, * -ExcludeProperty Name
    }
    else {
        Invoke-Centreon -Object TP -Action SHOW | Select-Object @{Name = "TimePeriod"; Expression = {$_.Name}}, * -ExcludeProperty Name
    }
}