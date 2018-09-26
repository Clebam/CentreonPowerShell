<#
    .SYNOPSIS
        Removes an existing instance
    .DESCRIPTION
        Removes an existing instance
    .PARAMETER Instance
        Corresponds to the name of the instance
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonInstance -Instance "PollerTest"

        Removes the instance
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonInstance {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Instance
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($Instance)) {
            foreach ($_instance in $Instance) {
                Invoke-Centreon -Object INSTANCE -Action DEL -Value $_instance
            }
        }
    }
    end {

    }
}