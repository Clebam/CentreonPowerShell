<#
    .SYNOPSIS
        Returns the parents of a host
    .DESCRIPTION
        Returns the parents of a host
    .PARAMETER HostName
        Name of the host
    .EXAMPLE
        Get-CentreonHostParent -HostName "WebMdz01"
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostParent {
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName,ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName
    )
        Invoke-Centreon -Object HOST -Action GETPARENT -Value $HostName
}