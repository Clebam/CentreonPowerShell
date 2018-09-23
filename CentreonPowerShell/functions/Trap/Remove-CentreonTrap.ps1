<#
    .SYNOPSIS
        Removes an existing trap
    .DESCRIPTION
        Removes an existing trap
    .PARAMETER Trap
        Corresponds to the name of the trap
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonTrap -Trap "aNewTrap"

        Removes the trap aNewTrap
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonTrap {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Trap
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($Trap)) {
            foreach ($_trap in $Trap) {
                Invoke-Centreon -Object TRAP -Action DEL -Value $_trap
            }
        }
    }
    end {

    }
}