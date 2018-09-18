<#
    .SYNOPSIS
        Adds a contact to a host template (APPEND). If you want to replace, use Set-CentreonHostTemplateContact
    .DESCRIPTION
        Adds a contact to a host template (APPEND). If you want to replace, use Set-CentreonHostTemplateContact
    .PARAMETER HostTemplate
        Name of the host template
    .PARAMETER Contact
        Name of the Contact
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Add-CentreonHostTemplateContact -HostTemplate "Webservers" -Contact "Clebam","C-Bam"

        Add the contacts Clebam and C-Bam to Webservers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Add-CentreonHostTemplateContact {
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
                Invoke-Centreon -Object HTPL -Action ADDCONTACT -Value "$_hosttemplate;$JoinedContact"
            }
        }
    }
    end {

    }
}