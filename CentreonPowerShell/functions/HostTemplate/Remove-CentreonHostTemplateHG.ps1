<#
    .SYNOPSIS
        Removes a host group from the host template
    .DESCRIPTION
        Removes a host group from the host template
    .PARAMETER HostTemplate
        Name of the host template
    .PARAMETER HostGroup
        Name of the Host Group
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonHostTemplateHG -HostTemplate "WebServers" -HostGroup "Mdz_WebServers"

        Removes the host group Mdz_WebServers from the host template WebServers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHostTemplateHG {
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
                Invoke-Centreon -Object HTPL -Action DELHOSTGROUP -Value "$_hostname;$JoinedHostGroup"
            }
        }
    }
    end {

    }
}