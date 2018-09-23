<#
    .SYNOPSIS
        Sets a trap matching rules (REPLACE)
    .DESCRIPTION
        Sets a trap matching rules (REPLACE)
    .PARAMETER RuleID
        ID of the matching rule
    .PARAMETER Parameter
        Matching rule Parameter to set
    .PARAMETER Value
        Value applied to parameter
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonTrapMatching -RuleID "8" -Parameter status -Value "critical"

        Sets the rule with id = 8 : status to critical
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonTrapMatching {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $RuleID,
        [Parameter(Mandatory)]
        [ValidateSet(
            "string",
            "order",
            "status",
            "regexp"
        )]
        [string] $Parameter,
        [Parameter(Mandatory)]
        $Value
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($RuleID)) {
            foreach ($_ruleid in $RuleID) {
                Invoke-Centreon -Object TRAP -Action UPDATEMATCHING -Value "$_ruleid;$Parameter;$Value"
            }
        }
    }
    end {

    }
}