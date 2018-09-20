<#
    .SYNOPSIS
        Removes an existing command
    .DESCRIPTION
        Removes an existing command
    .PARAMETER Command
        Corresponds to the name of the command
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonCommand -Command check-host-alive

        Removes the command named check-host-alive
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonCommand {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Command
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($Command)) {
            foreach ($_command in $Command) {
                Invoke-Centreon -Object CMD -Action DEL -Value "$_command"
            }
        }
    }
    end {

    }
}