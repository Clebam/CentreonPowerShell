<#
    .SYNOPSIS
        Sets a dependency parameter value
    .DESCRIPTION
        Sets a dependency parameter value
    .PARAMETER Dependency
        Name of the dependency
    .PARAMETER Parameter
        Trap Parameter to set
    .PARAMETER Value
        Value applied to parameter
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonDepencyParameter -Dependency "my dependency" -Parameter description -Value "any description"

        Set the parameter description with a new value on dependency "my dependency"
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonDependencyParameter {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Dependency,
        [Parameter(Mandatory)]
        [ValidateSet(
            "name",
            "description",
            "comment",
            "inherits_parent",
            "execution_failure_criteria",
            "notification_failure_criteria"
        )]
        [string] $Parameter,
        [Parameter(Mandatory)]
        $Value
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($Dependency)) {
            foreach ($_dependency in $Dependency) {
                Invoke-Centreon -Object DEP -Action SETPARAM -Value "$_dependency;$Parameter;$Value"
            }
        }
    }
    end {

    }
}