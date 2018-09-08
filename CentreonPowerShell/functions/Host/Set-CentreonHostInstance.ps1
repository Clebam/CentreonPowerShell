<#
    .SYNOPSIS
        Sets the poller from which a host will be monitored
    .DESCRIPTION
        Sets the poller from which a host will be monitored
    .PARAMETER HostName
        Name of the host
    .PARAMETER PollerName
        Name of the poller
    .EXAMPLE
        Set-CentreonHostInstance -HostName "WebMdz01" -PollerName Poller1
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostInstance {
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName,
        [Parameter(Mandatory)]
        [string] $PollerName
    )
    Invoke-Centreon -Object HOST -Action SETINSTANCE -Value "$HostName;$PollerName"
}