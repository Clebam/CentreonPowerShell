<#
    .SYNOPSIS
        Sets the poller linked to host template
    .DESCRIPTION
        Sets the poller linked to host template
    .PARAMETER HostTemplate
        Name of the host template
    .PARAMETER PollerName
        Name of the poller
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostTemplateInstance -HostTemplate "WebServers" -PollerName Poller1

        Links the host template WebServers to the poller Poller1
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostTemplateInstance {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostTemplate,
        [Parameter(Mandatory)]
        [string] $PollerName
    )

    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($HostTemplate)) {
            foreach ($_hosttemplate in $HostTemplate) {
                Invoke-Centreon -Object HTPL -Action SETINSTANCE -Value "$_hosttemplate;$PollerName"
            }
        }
    }
    end {

    }
}