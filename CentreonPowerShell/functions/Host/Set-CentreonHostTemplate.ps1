<#
    .SYNOPSIS
        Sets a template to a host (REPLACE). If you want to append, use Add-CentreonHostTemplate
    .DESCRIPTION
        Sets a template to a host (REPLACE). If you want to append, use Add-CentreonHostTemplate
    .PARAMETER HostName
        Name of the host
    .PARAMETER HtplName
        Name of the HTPL (Host Template)
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostTemplate -HostName "WebMdz01" -HtplName "OS-Linux-SNMP-Custom"

        Replaces the templates linked to WebMdz01 by OS-Linux-SNMP-Custom
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostTemplate {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName,
        [ValidateNotNullOrEmpty()]
        [string[]] $HtplName
    )
    $HtplName = $HtplName -join "|"
    if ($PSCmdlet.ShouldProcess($HostName)) {
        Invoke-Centreon -Object HOST -Action SETTEMPLATE -Value "$HostName;$HtplName"
    }
}