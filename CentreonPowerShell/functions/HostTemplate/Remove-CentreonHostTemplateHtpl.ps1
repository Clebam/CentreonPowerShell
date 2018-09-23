<#
    .SYNOPSIS
        Removes a template bound to a host template
    .DESCRIPTION
        Removes a template bound to a host template
    .PARAMETER HostTemplate
        Name of the host template
    .PARAMETER ParentHostTemplate
        Name of the parent Host Template
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonHostTemplateHtpl -HostTemplate "WebServers" -ParentHostTemplate "OS-Linux-SNMP-Custom", "OS-Linux-SNMP"

        Removes the templates OS-Linux-SNMP-Custom and OS-Linux-SNMP from the host template WebServers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHostTemplateHtpl {
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
                Invoke-Centreon -Object HTPL -Action DELTEMPLATE -Value "$_hostname;$JoinedParentHostTemplate"
            }
        }
    }
    end {

    }
}