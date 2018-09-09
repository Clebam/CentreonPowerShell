<#
    .SYNOPSIS
        Disable a enabled host
    .DESCRIPTION
        Disable a enabled host
    .PARAMETER HostName
        Name of the host
    .EXAMPLE
        Disable-CentreonHost -HostName "WebMdz01"

        It disables the host WebMdz (Parameter activate=0)
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Disable-CentreonHost {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName
    )
    Invoke-Centreon -Object HOST -Action DISABLE -Value $HostName
}