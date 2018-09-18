<#
    .SYNOPSIS
        Sets a host group bound to a host (REPLACE). If you want to append, use Add-CentreonHostTemplateHG
    .DESCRIPTION
        Sets a host group bound to a host (REPLACE). If you want to append, use Add-CentreonHostTemplateHG
    .PARAMETER HostTemplate
        Name of the host template
    .PARAMETER HostGroup
        Name of the Host Group
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostTemplateHG -HostTemplate "WebServers" -HostGroup "Mdz_WebServers"

        Replaces the host groups bound to WebServers by Mdz_WebServers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostTemplateHG {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostTemplate,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostGroup
    )

    begin {
        $JoinedHostGroup = $HostGroup -join "|"
    }
    process {
        if ($PSCmdlet.ShouldProcess($HostTemplate)) {
            foreach ($_hosttemplate in $HostTemplate) {
                Invoke-Centreon -Object HTPL -Action SETHOSTGROUP -Value "$_hosttemplate;$JoinedHostGroup"
            }
        }
    }
    end {

    }
}