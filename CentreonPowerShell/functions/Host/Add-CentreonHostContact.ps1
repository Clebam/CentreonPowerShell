﻿<#
    .SYNOPSIS
        Adds a contact to a host (APPEND). If you want to replace, use Set-CentreonHostContact
    .DESCRIPTION
        Adds a contact to a host (APPEND). If you want to replace, use Set-CentreonHostContact
    .PARAMETER HostName
        Name of the host
    .PARAMETER Contact
        Name of the Contact
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Add-CentreonHostContact -HostName "WebMdz01" -Contact "Clebam","C-Bam"

        Add the contacts Clebam and C-Bam to WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Add-CentreonHostContact {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostName,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Contact
    )
    begin {
        $JoinedContact = $Contact -join "|"
    }
    process {
        if ($PSCmdlet.ShouldProcess($HostName)) {
            foreach ($_hostname in $HostName) {
                Invoke-Centreon -Object HOST -Action ADDCONTACT -Value "$_hostname;$JoinedContact"
            }
        }
    }
    end {

    }
}