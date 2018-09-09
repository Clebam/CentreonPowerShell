<#
    .SYNOPSIS
        Removes a template bound to a host
    .DESCRIPTION
        Removes a template bound to a host
    .PARAMETER HostName
        Name of the host
    .PARAMETER HtplName
        Name of the HTPL (Host Template)
    .EXAMPLE
        Remove-CentreonHostTemplate -HostName "WebMdz01" -HtplName "OS-Linux-SNMP-Custom", "OS-Linux-SNMP"

        Removes the templates OS-Linux-SNMP-Custom and OS-Linux-SNMP from the host WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHostTemplate {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName,
        [ValidateNotNullOrEmpty()]
        [string[]] $HtplName
    )
    $HtplName = $HtplName -join "|"
    Invoke-Centreon -Object HOST -Action DELTEMPLATE -Value "$HostName;$HtplName"
}