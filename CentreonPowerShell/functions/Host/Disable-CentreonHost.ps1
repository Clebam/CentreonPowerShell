<#
    .SYNOPSIS
        Disable a enabled host
    .DESCRIPTION
        Disable a enabled host
    .PARAMETER HostName
        Name of the host
    .EXAMPLE
        Disable-CentreonHost -HostName "WebMdz01"
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Disable-CentreonHost {
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName
    )
    Invoke-Centreon -Object HOST -Action DISABLE -Value $HostName
}