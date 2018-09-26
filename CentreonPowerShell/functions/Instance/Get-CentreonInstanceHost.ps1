<#
    .SYNOPSIS
        Returns a list of host linked to instance (poller)
    .DESCRIPTION
        Returns a list of host linked to instance (poller)
    .PARAMETER Instance
        Name of the instance
    .EXAMPLE
        Get-CentreonInstance -Instance "PollerTest"

        eturns a list of host linked to instance PollerTest
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonInstanceHost {
    [CmdletBinding()]
    param (
        [string] $Instance
    )
    begin {

    }
    process {
        foreach ($_instance in $Instance) {
            $PSObject = [PSCustomObject]@{
                Instance = $_instance -as [string]
                HostName = [PSCustomObject] (Invoke-Centreon -Object INSTANCE -Action GETHOSTS -Value $_instance | Select-Object -ExpandProperty Name)
            }
            $PSObject
        }
    }
    end {

    }
}