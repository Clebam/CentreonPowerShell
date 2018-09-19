<#
    .SYNOPSIS
        Unset the severity on the host category
    .DESCRIPTION
        Unset the severity on the host category
    .PARAMETER HostCategory
        Name of the host category
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Clear-CentreonHostCategorySeverity -HostCategory "WebServer_Critical"

        Unsets the severity on the host category WebServer_Critical
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Clear-CentreonHostCategorySeverity {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostCategory
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($HostCategory)) {
            foreach ($_hostcategory in $HostCategory) {
                Invoke-Centreon -Object HOST -Action UNSETSEVERITY -Value "$_hostcategory"
            }
        }
    }
    end {

    }
}