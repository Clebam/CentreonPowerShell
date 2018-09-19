<#
    .SYNOPSIS
        Removes an existing host category
    .DESCRIPTION
        Removes an existing host category
    .PARAMETER HostCategory
        Corresponds to the name of the host category
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonHost -HostCategory "WebServer_Critical"

        Removes the host category WebServer_Critical
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHostCategory {
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
                Invoke-Centreon -Object HC -Action DEL -Value $_hostcategory
            }
        }
    }
    end {

    }
}