<#
    .SYNOPSIS
        Sets a template to a host (REPLACE). If you want to append, use Add-CentreonHostTemplate
    .DESCRIPTION
        Sets a template to a host (REPLACE). If you want to append, use Add-CentreonHostTemplate
    .PARAMETER HostName
        Name of the host
    .PARAMETER HtplName
        Name of the HTPL (Host Template)
    .EXAMPLE
        Set-CentreonHostTemplate -HostName "WebMdz01" -HtplName "OS-Linux-SNMP-Custom"

        Replaces the templates linked to WebMdz01 by OS-Linux-SNMP-Custom
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostTemplate {
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName,
        [ValidateNotNullOrEmpty()]
        [string[]] $HtplName
    )
    $HtplName = $HtplName -join "|"
    Invoke-Centreon -Object HOST -Action SETTEMPLATE -Value "$HostName;$HtplName"
}