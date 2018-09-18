<#
    .SYNOPSIS
        Adds a template to a host template (APPEND). If you want to replace, use Set-CentreonHostTemplateHtpl
    .DESCRIPTION
        Adds a template to a host (APPEND). If you want to replace, use Set-CentreonHostTemplateHtpl
    .PARAMETER HostTemplate
        Name of the host template
    .PARAMETER ParentHostTemplate
        Name of the parent HostTemplate
    .EXAMPLE
        Add-CentreonHostTemplateHtpl -HostTemplate "WebServers" -ParentHostTemplate "OS-Linux-SNMP-Custom", "OS-Linux-SNMP"

        This adds OS-Linux-SNMP and OS-Linux-SNMP-Custom to the host template WebServers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Add-CentreonHostTemplateHtpl {
    [CmdletBinding()]
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
        foreach ($_hosttemplate in $HostTemplate) {
            Invoke-Centreon -Object HTPL -Action ADDTEMPLATE -Value "$_hosttemplate;$JoinedParentHostTemplate"
        }
    }
    end {

    }
}