﻿<#
    .SYNOPSIS
        Removes a parent from a host
    .DESCRIPTION
        Removes a parent from a host
    .PARAMETER HostName
        Name of the host
    .PARAMETER ParentName
        Name of the parent
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonHostParent -HostName "WebMdz01" -ParentName "GWMdz01","GWMdz02"

        This removes existing parents GWMdz01 and GWMdz02 from WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHostParent {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostName,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $ParentName
    )

    begin {
        $JoinedParentName = $ParentName -join "|"
    }
    process {
        if ($PSCmdlet.ShouldProcess($HostName)) {
            foreach ($_hostname in $HostName) {
                Invoke-Centreon -Object HOST -Action DELPARENT -Value "$_hostname;$JoinedParentName"
            }
        }
    }
    end {

    }
}