<#
    .SYNOPSIS
        Removes an existing dependency
    .DESCRIPTION
        Removes an existing dependency
    .PARAMETER Dependency
        Corresponds to the name of the dependency
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonDepency -Dependency "PollerTest"

        Removes the dependency
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonDepency {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Dependency
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($Dependency)) {
            foreach ($_dependency in $Dependency) {
                Invoke-Centreon -Object DEP -Action DEL -Value $_dependency
            }
        }
    }
    end {

    }
}