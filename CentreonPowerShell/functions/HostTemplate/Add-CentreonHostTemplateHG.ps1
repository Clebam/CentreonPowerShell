<#
    .SYNOPSIS
        Adds a host group bound to a host template (APPEND). If you want to replace, use Set-CentreonHostTemplateHG
    .DESCRIPTION
        Adds a host group bound to a host (APPEND). If you want to replace, use Set-CentreonHostTemplateHG
    .PARAMETER HostTemplate
        Name of the host template
    .PARAMETER HostGroup
        Name of the Host Group
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Add-CentreonHostTemplateHG -HostTemplate "Webservers" -HostGroup "Mdz_WebServers"

        Adds the host group Mdz_WebServers to Webservers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Add-CentreonHostTemplateHG {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [Alias("Name")]
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
                Invoke-Centreon -Object HTPL -Action ADDHOSTGROUP -Value "$_hosttemplate;$JoinedHostGroup"
            }
        }
    }
    end {

    }
}