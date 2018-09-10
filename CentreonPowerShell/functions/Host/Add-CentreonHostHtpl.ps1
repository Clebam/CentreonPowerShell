<#
    .SYNOPSIS
        Adds a template to a host (APPEND). If you want to replace, use Set-CentreonHostTemplate
    .DESCRIPTION
        Adds a template to a host (APPEND). If you want to replace, use Set-CentreonHostTemplate
    .PARAMETER HostName
        Name of the host
    .PARAMETER HostTemplate
        Name of the HostTemplate
    .EXAMPLE
        Add-CentreonHostHtpl -HostName "WebMdz01" -HostTemplate "OS-Linux-SNMP-Custom", "OS-Linux-SNMP"

        This adds OS-Linux-SNMP and OS-Linux-SNMP-Custom to the host WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Add-CentreonHostHtpl {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName,
        [ValidateNotNullOrEmpty()]
        [string[]] $HostTemplate
    )
    $HostTemplate = $HostTemplate -join "|"
    Invoke-Centreon -Object HOST -Action ADDTEMPLATE -Value "$HostName;$HostTemplate"
}