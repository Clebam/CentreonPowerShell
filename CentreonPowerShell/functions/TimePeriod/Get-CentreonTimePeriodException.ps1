<#
    .SYNOPSIS
        Returns a list of exceptions applied to a time period
    .DESCRIPTION
        Returns a list of exceptions applied to a time period
    .PARAMETER TimePeriod
        Corresponds to the name of the time period
    .EXAMPLE
        Get-CentreonHostTimePeriodException -TimePeriod "Mornings", "Evenings"

        Returns all the exception applied to the time period "Mornings"
    .EXAMPLE
        Get-CentreonTimePeriod -Filter "work"

        Returns the time periods with "work" in their name
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonTimePeriodException {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $TimePeriod
    )
    begin {

    }
    process {
        foreach ($_timeperiod in $TimePeriod) {
            $PSObject = [PSCustomObject]@{
                TimePeriod = $_timeperiod -as [string]
                Exception  = Invoke-Centreon -Object TP -Action GETEXCEPTION -Value $_timeperiod
            }
            $PSObject
        }
    }
    end {

    }
}