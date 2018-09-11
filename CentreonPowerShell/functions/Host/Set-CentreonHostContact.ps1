<#
    .SYNOPSIS
        Sets a contact to a host (REPLACE). If you want to append, use Add-CentreonHostContact
    .DESCRIPTION
        Sets a contact to a host (REPLACE). If you want to append, use Add-CentreonHostContact
    .PARAMETER HostName
        Name of the host
    .PARAMETER Contact
        Name of the Contact
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostContact -HostName "WebMdz01" -Contact "Clebam","C-Bam"

        Replaces the contacts linked to WebMdz01 by Clebam and C-Bam
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostContact {
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
    $Contact = $Contact -join "|"
    if ($PSCmdlet.ShouldProcess($HostName)) {
        foreach ($_hostname in $HostName) {
            Invoke-Centreon -Object HOST -Action SETCONTACT -Value "$_hostname;$Contact"
        }
    }
}