<#
    .SYNOPSIS
        Unset the severity on the host template
    .DESCRIPTION
        Unset the severity on the host template
    .PARAMETER HostTemplate
        Name of the host template
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Clear-CentreonHostTemplateSeverity -HostTemplate "WebServers"

        Unsets the severity on the host WebServers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Clear-CentreonHostTemplateSeverity {
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
                Invoke-Centreon -Object HTPL -Action UNSETSEVERITY -Value "$_hosttemplate"
            }
        }
    }
    end {

    }
}