<#
    .SYNOPSIS
        Enable a disabled host
    .DESCRIPTION
        Enable a disabled host
    .PARAMETER HostName
        Name of the host
    .EXAMPLE
        Enable-CentreonHost -HostName "WebMdz01"
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Enable-CentreonHost {
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName
    )
    Invoke-Centreon -Object HOST -Action ENABLE -Value $HostName
}