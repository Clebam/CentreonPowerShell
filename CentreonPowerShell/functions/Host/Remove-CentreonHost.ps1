<#
    .SYNOPSIS
        Removes an existing host
    .DESCRIPTION
        Removes an existing host
    .PARAMETER HostName
        Corresponds to the name of the host
    .EXAMPLE
        Remove-CentreonHost -HostName "WebMdz01"

        Removes the host WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHost {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName
    )
    Invoke-Centreon -Object HOST -Action DEL -Value $HostName
}