<#
    .SYNOPSIS
        Sets a template to a host (REPLACE). If you want to append, use Add-CentreonHostTemplate
    .DESCRIPTION
        Sets a template to a host (REPLACE). If you want to append, use Add-CentreonHostTemplate
    .PARAMETER HostName
        Name of the host
    .PARAMETER HostTemplate
        Name of the Host Template
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostHtpl -HostName "WebMdz01" -HostTemplate "OS-Linux-SNMP-Custom"

        Replaces the templates linked to WebMdz01 by OS-Linux-SNMP-Custom
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostHtpl {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName,
        [ValidateNotNullOrEmpty()]
        [string[]] $HostTemplate
    )
    $HostTemplate = $HostTemplate -join "|"
    if ($PSCmdlet.ShouldProcess($HostName)) {
        Invoke-Centreon -Object HOST -Action SETTEMPLATE -Value "$HostName;$HtplName"
    }
}