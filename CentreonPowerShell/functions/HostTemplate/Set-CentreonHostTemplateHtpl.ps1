<#
    .SYNOPSIS
        Sets a template to a host (REPLACE). If you want to append, use Add-CentreonHostTemplateHtpl
    .DESCRIPTION
        Sets a template to a host (REPLACE). If you want to append, use Add-CentreonHostTemplateHtpl
    .PARAMETER HostTemplate
        Name of the host template
    .PARAMETER ParentHostTemplate
        Name of the Host Template
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostTemplateHtpl -HostTemplate "WebServers" -ParentHostTemplate "OS-Linux-SNMP-Custom"

        Replaces the templates linked to the host template WebServers by OS-Linux-SNMP-Custom
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostTemplateHtpl {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostTemplate,
        [ValidateNotNullOrEmpty()]
        [string[]] $ParentHostTemplate
    )

    begin {
        $JoinedParentHostTemplate = $ParentHostTemplate -join "|"
    }
    process {
        if ($PSCmdlet.ShouldProcess($HostTemplate)) {
            foreach ($_hosttemplate in $HostTemplate) {
                Invoke-Centreon -Object HTPL -Action SETTEMPLATE -Value "$_hostname;$JoinedParentHostTemplate"
            }
        }
    }
    end {

    }
}