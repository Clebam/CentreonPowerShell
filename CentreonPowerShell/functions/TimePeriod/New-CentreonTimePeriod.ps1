<#
    .SYNOPSIS
        Creates a new time period
    .DESCRIPTION
        Creates a new time period
    .PARAMETER TimePeriod
        Corresponds to the name of the time period
    .PARAMETER Description
        Corresponds to the time period description (Alias)
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        New-CentreonTimePeriod -TimePeriod "Mornings" -Description "All the mornings from Monday to Friday"

        Creates a new time period named "Mornings" with its description
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function New-CentreonTimePeriod {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $TimePeriod,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Description
    )
    if ($PSCmdlet.ShouldProcess($TimePeriod)) {
        Invoke-Centreon -Object TP -Action ADD -Value "$TimePeriod;$Description"
    }
}