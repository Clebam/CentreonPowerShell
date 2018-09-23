<#
    .SYNOPSIS
        Returns a list of vendors
    .DESCRIPTION
        Returns a list of vendors
    .PARAMETER Filter
        Simple string filter. No Regex (Beware, foo will return foo1, foo2, foo3)
    .EXAMPLE
        Get-CentreonVendor

        Returns all the vendors in Centreon
    .EXAMPLE
        Get-CentreonVendor -Filter "Cisco"

        Returns the host with "Cisco" in their name
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonVendor {
    [CmdletBinding()]
    param (
        [string] $Filter
    )
    if ($Filter) {
        Invoke-Centreon -Object VENDOR -Action SHOW -Value $Filter | Select-Object @{Name = "Vendor"; Expression = {$_.Name}}, * -ExcludeProperty Name
    }
    else {
        Invoke-Centreon -Object VENDOR -Action SHOW | Select-Object @{Name = "Vendor"; Expression = {$_.Name}}, * -ExcludeProperty Name
    }
}