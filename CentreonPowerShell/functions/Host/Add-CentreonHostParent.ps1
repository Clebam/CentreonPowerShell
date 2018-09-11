<#
    .SYNOPSIS
        Adds a parent to a host (APPEND). If you want to replace, use Set-CentreonHostParent
    .DESCRIPTION
        Adds a parent to a host (APPEND). If you want to replace, use Set-CentreonHostParent
    .PARAMETER HostName
        Name of the host
    .PARAMETER ParentName
        Name of the parent
    .EXAMPLE
        Add-CentreonHostParent -HostName "WebMdz01" -ParentName "GWMdz01","GWMdz02"

        This adds GWMdz01 and GWMdz02 as parents of WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Add-CentreonHostParent {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [Alias("Name")]
		[string[]] $HostName,
        [ValidateNotNullOrEmpty()]
        [string[]] $ParentName
    )
    $ParentName = $ParentName -join "|"
    Invoke-Centreon -Object HOST -Action ADDPARENT -Value "$HostName;$ParentName"
}