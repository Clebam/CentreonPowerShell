<#
    .SYNOPSIS
        Creates a new vendor
    .DESCRIPTION
        Creates a new vendor
    .PARAMETER Vendor
        Corresponds to the name of the vendor
    .PARAMETER Description
        Corresponds to the vendor description (Alias)
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        New-CentreonVendor -Vendor "DLink" -Description "Dlink routers"

        Creates a new vendor named "DLink" with its description
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function New-CentreonVendor {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Vendor,
        [ValidateNotNullOrEmpty()]
        [string] $Description
    )
    if ($PSCmdlet.ShouldProcess($Vendor)) {
        Invoke-Centreon -Object VENDOR -Action ADD -Value "$Vendor;$Description"
    }
}