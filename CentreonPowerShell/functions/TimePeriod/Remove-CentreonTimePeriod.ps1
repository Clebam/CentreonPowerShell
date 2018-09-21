<#
    .SYNOPSIS
        Removes an existing time period
    .DESCRIPTION
        Removes an existing time period
    .PARAMETER TimePeriod
        Corresponds to the name of the time period
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonHost -TimePeriod "Mornings"

        Removes the time period Mornings
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonTimePeriod {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $TimePeriod
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($TimePeriod)) {
            foreach ($_timeperiod in $TimePeriod) {
                Invoke-Centreon -Object TP -Action DEL -Value $_timeperiod
            }
        }
    }
    end {

    }
}