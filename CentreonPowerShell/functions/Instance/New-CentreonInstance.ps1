<#
    .SYNOPSIS
        Creates a new instance
    .DESCRIPTION
        Creates a new instance
    .PARAMETER Instance
        Corresponds to the name of the instance
    .PARAMETER Address
        Corresponds to the IP Address of the poller
    .PARAMETER SshPort
        Corresponds to the SSH port used
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        New-CentreonInstance -Instance "PollerTest" -Address "10.0.0.2" -SshPort 2222

        Creates a new instance named "PollerTest" with address and sshport
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function New-CentreonInstance {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Instance,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Address,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $SshPort
    )
    if ($PSCmdlet.ShouldProcess($Instance)) {
        Invoke-Centreon -Object INSTANCE -Action ADD -Value "$Instance;$Address;$SshPort"
    }
}