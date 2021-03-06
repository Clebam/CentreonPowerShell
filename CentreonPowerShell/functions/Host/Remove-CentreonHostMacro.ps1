﻿<#
    .SYNOPSIS
        Removes a macro of a host
    .DESCRIPTION
        Removes a macro of a host
    .PARAMETER HostName
        Name of the host
    .PARAMETER MacroName
        Name of the macro
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonHostMacro -HostName "WebMdz01" -MacroName "Warning"

        Remove the macro named Warning from the host WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHostMacro {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostName,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $MacroName
    )

    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($HostName)) {
            foreach ($_hostname in $HostName) {
                Invoke-Centreon -Object HOST -Action DELMACRO -Value "$_hostname;$MacroName"
            }
        }
    }
    end {

    }
}