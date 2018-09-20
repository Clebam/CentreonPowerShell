<#
    .SYNOPSIS
        Sets a command parameter value
    .DESCRIPTION
        Sets a command parameter value
    .PARAMETER Command
        Name of the command
    .PARAMETER Parameter
        Command Parameter to set
    .PARAMETER Value
        Value applied to parameter
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonCommandParameter -Command "check-host-alive" -Parameter type -Value "notif"

        Set the parameter type with a new value on command check-host-alive
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonCommandParameter {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Command,
        [Parameter(Mandatory)]
        [ValidateSet(
            "comment",
            "example",
            "graph",
            "line",
            "name",
            "type"
        )]
        [string] $Parameter,
        [Parameter(Mandatory)]
        $Value
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($Command)) {
            foreach ($_command in $Command) {
                Invoke-Centreon -Object CMD -Action SETPARAM -Value "$_command;$Parameter;$Value"
            }
        }
    }
    end {

    }
}