<#
    .SYNOPSIS
        Removes a contact group from a host template
    .DESCRIPTION
        Removes a contact group from a host template
    .PARAMETER HostTemplate
        Name of the host template
    .PARAMETER ContactGroup
        Name of the Contact Group
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonHostTemplateCG -HostTemplate "WebServers" -ContactGroup "Mdz_Support"

        Removes the contact group Mdz_Support from the host template WebServers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHostTemplateCG {
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
                Invoke-Centreon -Object HTPL -Action DELCONTACTGROUP -Value "$_hosttemplate;$JoinedContactGroup"
            }
        }
    }
    end {

    }
}