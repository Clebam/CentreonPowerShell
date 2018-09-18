<#
    .SYNOPSIS
        Removes an existing host template
    .DESCRIPTION
        Removes an existing host template
    .PARAMETER HostTemplate
        Corresponds to the name of the host template
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonHostTemplate -HostTemplate "Webservers"

        Removes the host template Webservers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHostTemplate {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostTemplate
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($HostTemplate)) {
            foreach ($_hosttemplate in $HostTemplate) {
                Invoke-Centreon -Object HTPL -Action DEL -Value $_hosttemplate
            }
        }
    }
    end {

    }
}