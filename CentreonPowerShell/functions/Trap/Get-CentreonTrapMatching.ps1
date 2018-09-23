<#
    .SYNOPSIS
        Returns a the matching rules of a specific trap
    .DESCRIPTION
        Returns a the matching rules of a specific trap
    .PARAMETER Trap
        Corresponds to the name of the trap
    .EXAMPLE
        Get-CentreonTrapMatching -Trap "aNewTrap"

        Returns all the matching rules linked to "aNewtrap"
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonTrapMatching {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Trap
    )
    begin {

    }
    process {
        foreach ($_trap in $Trap) {
            $PSObject = [PSCustomObject]@{
                Trap  = $_trap -as [string]
                Rules = Invoke-Centreon -Object TRAP -Action SHOW -Value "$_trap"
            }
            $PSObject
        }
    }
    end {

    }
}