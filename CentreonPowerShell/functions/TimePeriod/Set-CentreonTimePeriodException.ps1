<#
    .SYNOPSIS
        Sets an exception on a time period (!!! if exception exists, it will be overwritten !!!)
    .DESCRIPTION
        Sets an exception on a time period (!!! if exception exists, it will be overwritten !!!)
    .PARAMETER TimePeriod
        Corresponds to the name of the time period
    .PARAMETER Day
        Day of the year ("January 1")
    .PARAMETER TimeRange
        Time range (00:00-24:00)
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostTimePeriodException -TimePeriod "Mornings" -Day "January 1" -TimeRange "00:00-24:00"

        Sets an exception for January 1st, full day on time period Mornings
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonTimePeriodException {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $TimePeriod,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Day,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        $TimeRange
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($TimePeriod)) {
            foreach ($_timeperiod in $TimePeriod) {
                Invoke-Centreon -Object TP -Action SETEXCEPTION -Value "$_timeperiod;$Day;$TimeRange"
            }
        }
    }
    end {

    }
}