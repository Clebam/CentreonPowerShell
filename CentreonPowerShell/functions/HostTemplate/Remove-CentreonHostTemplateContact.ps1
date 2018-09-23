<#
    .SYNOPSIS
        Removes a contact from the host template
    .DESCRIPTION
        Removes a contact from the host template
    .PARAMETER HostTemplate
        Name of the host template
    .PARAMETER Contact
        Name of the Contact
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonHostTemplateContact -HostTemplate "WebServers" -Contact "Clebam","C-Bam"

        Removes the contacts Clebam and C-Bam from WebServers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHostTemplateContact {
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
                Invoke-Centreon -Object HTPL -Action DELCONTACT -Value "$_hosttemplate;$JoinedContact"
            }
        }
    }
    end {

    }
}