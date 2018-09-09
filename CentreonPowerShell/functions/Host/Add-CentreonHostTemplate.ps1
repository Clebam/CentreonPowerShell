<#
    .SYNOPSIS
        Adds a template to a host (APPEND). If you want to replace, use Set-CentreonHostTemplate
    .DESCRIPTION
        Adds a template to a host (APPEND). If you want to replace, use Set-CentreonHostTemplate
    .PARAMETER HostName
        Name of the host
    .PARAMETER HtplName
        Name of the HTPL (Host Template)
    .EXAMPLE
        Add-CentreonHostTemplate -HostName "WebMdz01" -HtplName "OS-Linux-SNMP-Custom", "OS-Linux-SNMP"

        This adds OS-Linux-SNMP and OS-Linux-SNMP-Custom to the host WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Add-CentreonHostTemplate {
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName,
        [ValidateNotNullOrEmpty()]
        [string[]] $HtplName
    )
    $HtplName = $HtplName -join "|"
    Invoke-Centreon -Object HOST -Action ADDTEMPLATE -Value "$HostName;$HtplName"
}