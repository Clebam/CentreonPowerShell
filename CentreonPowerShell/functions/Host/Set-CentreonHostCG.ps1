﻿<#
    .SYNOPSIS
        Sets a contact groups to a host (REPLACE). If you want to append, use Add-CentreonHostCG
    .DESCRIPTION
        Sets a contact groups to a host (REPLACE). If you want to append, use Add-CentreonHostCG
    .PARAMETER HostName
        Name of the host
    .PARAMETER ContactGroup
        Name of the Contact Group
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostCG -HostName "WebMdz01" -ContactGroup "Mdz_Support"

        Replaces the contact groups linked to WebMdz01 by Mdz_Support
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostCG {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostName,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $ContactGroup
    )

    begin {
        $JoinedContactGroup = $ContactGroup -join "|"
    }
    process {
        if ($PSCmdlet.ShouldProcess($HostName)) {
            foreach ($_hostname in $HostName) {
                Invoke-Centreon -Object HOST -Action SETCONTACTGROUP -Value "$_hostname;$JoinedContactGroup"
            }
        }
    }
    end {

    }
}