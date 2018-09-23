<#
    .SYNOPSIS
        Creates a new trap
    .DESCRIPTION
        Creates a new trap
    .PARAMETER Trap
        Corresponds to the name of the trap
    .PARAMETER OID
        Corresponds to the OID of the SNMP Trap
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        New-CentreonTrap -Trap "aNewTrap" -OID ".1.3.6.1.4.1.11.2.3.9.7.1.0.30"

        Creates a new trap named "aNewTrap" with OID ".1.3.6.1.4.1.11.2.3.9.7.1.0.30"
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function New-CentreonTrap {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Trap,
        [ValidateNotNullOrEmpty()]
        [string] $OID
    )
    if ($PSCmdlet.ShouldProcess($Vendor)) {
        Invoke-Centreon -Object TRAP -Action ADD -Value "$Trap;$OID"
    }
}