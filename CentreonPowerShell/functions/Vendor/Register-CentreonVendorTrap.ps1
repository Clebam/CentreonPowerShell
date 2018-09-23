<#
    .SYNOPSIS
        Generates a new trap from a mib file
    .DESCRIPTION
        Generates a new trap from a mib file
    .PARAMETER Vendor
        Corresponds to the name of the vendor
    .PARAMETER Path
        Corresponds to the of the MIB file
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Register-CentreonVendorTrap -Vendor "DLink" -Path "/usr/share/mymibs/dlink/DLINK-xxx.mib"

        Creates a new trap for "DLink" from a mib file
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Register-CentreonVendorTrap {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Vendor,
        [ValidateNotNullOrEmpty()]
        [string] $Path
    )
    if ($PSCmdlet.ShouldProcess($Vendor)) {
        if (Test-Path -$Path) {
            Invoke-Centreon -Object VENDOR -Action GENERATETRAPS -Value "$Vendor;$Path"
        }
    }
}