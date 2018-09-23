<#
    .SYNOPSIS
        Sets a trap parameter value
    .DESCRIPTION
        Sets a trap parameter value
    .PARAMETER Trap
        Name of the trap
    .PARAMETER Parameter
        Trap Parameter to set
    .PARAMETER Value
        Value applied to parameter
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonTrap -Trap "DLink" -Parameter alias -Value "DLink routers and switches"

        Set the parameter alias with a new value on trap DLink
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
        [Parameter(Mandatory)]
        [ValidateSet(
            "name",
            "comments",
            "output",
            "oid",
            "status",
            "vendor",
            "matching_mode",
            "reschedule_svc_enable",
            "execution_command",
            "execution_command_enable",
            "submit_result_enable"
        )]
        [string] $Parameter,
        [Parameter(Mandatory)]
        $Value
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($Trap)) {
            foreach ($_trap in $Trap) {
                Invoke-Centreon -Object TRAP -Action SETPARAM -Value "$_trap;$Parameter;$Value"
            }
        }
    }
    end {

    }
}