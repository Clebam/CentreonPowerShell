<#
    .SYNOPSIS
        Removes a trap matching rules
    .DESCRIPTION
        Removes a trap matching rules
    .PARAMETER RuleID
        ID of the matching rule
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonTrapMatching -RuleID "8"

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
        [string[]] $RuleID
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($RuleID)) {
            foreach ($_ruleid in $RuleID) {
                Invoke-Centreon -Object TRAP -Action DELMATCHING -Value "$_ruleid"
            }
        }
    }
    end {

    }
}