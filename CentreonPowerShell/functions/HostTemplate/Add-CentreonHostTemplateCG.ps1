<#
    .SYNOPSIS
        Adds a contact groups to a host template (APPEND). If you want to replace, use Set-CentreonHostTemplateCG
    .DESCRIPTION
        Adds a contact groups to a host template (APPEND). If you want to replace, use Set-CentreonHostTemplateCG
    .PARAMETER HostTemplate
        Name of the host template
    .PARAMETER ContactGroup
        Name of the Contact Group
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostTemplateCG -HostTemplate "WebServers" -ContactGroup "Mdz_Support"

        Add the contact group Mdz_Support to WebServers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Add-CentreonHostTemplateCG {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostTemplate,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $ContactGroup
    )
    begin {
        $JoinedContactGroup = $ContactGroup -join "|"
    }
    process {
        if ($PSCmdlet.ShouldProcess($HostTemplate)) {
            foreach ($_hosttemplate in $HostTemplate) {
                Invoke-Centreon -Object HTPL -Action ADDCONTACTGROUP -Value "$_hosttemplate;$JoinedContactGroup"
            }
        }
    }
    end {

    }
}