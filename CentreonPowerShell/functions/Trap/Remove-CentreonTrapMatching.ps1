<#
    .SYNOPSIS
        Removes a trap matching rules
    .DESCRIPTION
        Removes a trap matching rules
    .PARAMETER Id
        ID of the matching rule
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonTrapMatching -Id "8"

        Removes the matching rule with ID 8
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonTrapMatching {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Id
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($Id)) {
            foreach ($_id in $Id) {
                Invoke-Centreon -Object TRAP -Action DELMATCHING -Value "$_id"
            }
        }
    }
    end {

    }
}