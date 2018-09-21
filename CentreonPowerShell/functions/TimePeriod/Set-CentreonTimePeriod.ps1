<#
    .SYNOPSIS
        Sets a time period parameter value
    .DESCRIPTION
        Sets a time period parameter value
    .PARAMETER TimePeriod
        Name of the time period
    .PARAMETER Parameter
        Time period Parameter to set
    .PARAMETER Value
        Value applied to parameter
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonTimePeriod -TimePeriod "Mornings" -Parameter alias -Value "Mornings from Monday to Saturday"

        Sets the parameter alias with a new value on time period "Mornings"
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonTimePeriod {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $TimePeriod,
        [Parameter(Mandatory)]
        [ValidateSet(
            "name",
            "alias",
            "sunday",
            "monday",
            "tuesday",
            "wednesday",
            "thursday",
            "friday",
            "saturday",
            "include",
            "exclude"
        )]
        [string] $Parameter,
        [Parameter(Mandatory)]
        $Value
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($TimePeriod)) {
            foreach ($_timeperiod in $TimePeriod) {
                Invoke-Centreon -Object TP -Action SETPARAM -Value "$_timeperiod;$Parameter;$Value"
            }
        }
    }
    end {

    }
}