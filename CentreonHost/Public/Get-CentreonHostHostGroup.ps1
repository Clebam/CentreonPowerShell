<#
    .SYNOPSIS
        Returns the contacts linked to a host
    .DESCRIPTION
        Returns the contacts linked to a host
    .PARAMETER HostName
        Name of the host
    .EXAMPLE
        Get-CentreonHostHostGroup -HostName "WebMdz01"
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostHostGroup {
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName,ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName
    )
        Invoke-Centreon -Object HOST -Action GETHOSTGROUP -Value $HostName
}