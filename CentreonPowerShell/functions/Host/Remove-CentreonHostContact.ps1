<#
    .SYNOPSIS
        Removes a contact from the host
    .DESCRIPTION
        Removes a contact from the host
    .PARAMETER HostName
        Name of the host
    .PARAMETER Contact
        Name of the Contact
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Removes-CentreonHostContact -HostName "WebMdz01" -Contact "Clebam","C-Bam"

        Removes the contacts Clebam and C-Bam from WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Add-CentreonHostContact {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [Alias("Name")]
        [string[]] $HostName,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Contact
    )
    begin {
        $Contact = $Contact -join "|"
    }
    process {
        if ($PSCmdlet.ShouldProcess($HostName)) {
            foreach ($_hostname in $HostName) {
                Invoke-Centreon -Object HOST -Action DELCONTACT -Value "$_hostname;$Contact"
            }
        }
    }
    end {

    }
}