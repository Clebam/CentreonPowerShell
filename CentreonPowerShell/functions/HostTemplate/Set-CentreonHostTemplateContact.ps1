<#
    .SYNOPSIS
        Sets a contact to a host (REPLACE). If you want to append, use Add-CentreonHostTemplateContact
    .DESCRIPTION
        Sets a contact to a host (REPLACE). If you want to append, use Add-CentreonHostTemplateContact
    .PARAMETER HostTemplate
        Name of the host template
    .PARAMETER Contact
        Name of the Contact
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostTemplateContact -HostTemplate "WebServers" -Contact "Clebam","C-Bam"

        Replaces the contacts linked to the host template WebServers by Clebam and C-Bam
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostTemplateContact {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostTemplate,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Contact
    )

    begin {
        $JoinedContact = $Contact -join "|"
    }
    process {
        if ($PSCmdlet.ShouldProcess($HostTemplate)) {
            foreach ($_hosttemplate in $HostTemplate) {
                Invoke-Centreon -Object HTPL -Action SETCONTACT -Value "$_hosttemplate;$JoinedContact"
            }
        }
    }
    end {

    }
}