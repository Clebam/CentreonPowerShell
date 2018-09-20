<#
    .SYNOPSIS
        Creates a new command
    .DESCRIPTION
        Creates a new command
    .PARAMETER Command
        Corresponds to the name of the command
    .PARAMETER Type
        Corresponds to the type of the command
    .PARAMETER CommandLine
        Corresponds to the command line used by the command
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        New-CentreonCommand -Command check-host-alive -Type check -CommandLine '$USER1$/check_ping -H $HOSTADDRESS$ -w 3000.0,80% -c 5000.0,100% -p1'

        Creates a new command name check-host-alive as a check commande with proper command line
    .EXAMPLE
        $CommandLine =
        @'
        /usr/bin/printf "%b" "{$Whatever} ***** centreon Notification *****\n\nType:$NOTIFICATIONTYPE$\nHost: $HOSTNAME$\nState: $HOSTSTATE$\nAddress: $HOSTADDRESS$\nInfo: $HOSTOUTPUT$\nDate/Time: $DATE$" | @MAILER@ -s "Host $HOSTSTATE$ alert for $HOSTNAME$!" $CONTACTEMAIL$
        '@
        New-CentreonCommand -Command notify-host-by-mail -Type notif -CommandLine $CommandLine

        Using single quote here-string is the way to go when scripts have many wild characters
        .NOTES
        Author: Clebam
        Version: 1.0
#>
function New-CentreonCommand {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Command,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [ValidateSet(
            "check",
            "notif",
            "misc"
        )]
        [string] $Type,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $CommandLine
    )
    if ($PSCmdlet.ShouldProcess($Command)) {
        Invoke-Centreon -Object CMD -Action ADD -Value "$Command;$Type;$CommandLine"
    }
}