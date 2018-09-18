<#
    .SYNOPSIS
        Removes an existing host
    .DESCRIPTION
        Removes an existing host
    .PARAMETER HostName
        Corresponds to the name of the host
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonHost -HostName "WebMdz01"

        Removes the host WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHost {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostName
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($HostName)) {
            foreach ($_hostname in $HostName) {
                Invoke-Centreon -Object HOST -Action DEL -Value $_hostname
            }
        }
    }
    end {

    }
}