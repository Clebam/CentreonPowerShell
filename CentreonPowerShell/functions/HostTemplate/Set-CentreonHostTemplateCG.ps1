<#
    .SYNOPSIS
        Sets a contact groups to a host (REPLACE). If you want to append, use Add-CentreonHostTemplateCG
    .DESCRIPTION
        Sets a contact groups to a host (REPLACE). If you want to append, use Add-CentreonHostTemplateCG
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

        Replaces the contact groups linked to WebServers by Mdz_Support
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostTemplateCG {
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
                Invoke-Centreon -Object HTPL -Action SETCONTACTGROUP -Value "$_hosttemplate;$JoinedContactGroup"
            }
        }
    }
    end {

    }
}