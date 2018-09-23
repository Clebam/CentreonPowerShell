<#
    .SYNOPSIS
        Adds a trap matching rules (APPEND)
    .DESCRIPTION
        Adds a trap matching rules (APPEND)
    .PARAMETER Trap
        Name of the trap
    .PARAMETER InputString
        This is the string where to find the match - Default and recommended value is Centreon Variable @OUTPUT@
    .PARAMETER MatchString
        This is the string to match
    .PARAMETER Status
        This is the status to submit
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Add-CentreonTrapMatching -Trap "aNewtrap" -MatchString "/test2/" -Status CRITICAL

        Add a matching rule on trap "aNewtrap", on default output, with matching string "/test2/" and status critical
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonTrapParameter {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Trap,
        [string] $InputString = '@OUTPUT@',
        [Parameter(Mandatory)]
        [string] $MatchString,
        [Parameter(Mandatory)]
        [ValidateSet(
            "0",
            "1",
            "2",
            "3",
            "OK",
            "WARNING",
            "CRITICAL",
            "UNKNOWN"
        )]
        [string] $Status
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($Trap)) {
            foreach ($_trap in $Trap) {
                Invoke-Centreon -Object TRAP -Action ADDMATCHING -Value "$_trap;$InputString;$MatchString;$Status"
            }
        }
    }
    end {

    }
}