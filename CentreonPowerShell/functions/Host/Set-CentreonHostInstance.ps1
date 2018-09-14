<#
    .SYNOPSIS
        Sets the poller from which a host will be monitored
    .DESCRIPTION
        Sets the poller from which a host will be monitored
    .PARAMETER HostName
        Name of the host
    .PARAMETER PollerName
        Name of the poller
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostInstance -HostName "WebMdz01" -PollerName Poller1

        Links the host WebMdz01 to the poller Poller1
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostInstance {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [Alias("Name")]
        [string[]] $HostName,
        [Parameter(Mandatory)]
        [string] $PollerName
    )
    
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($HostName)) {
            foreach ($_hostname in $HostName) {
                Invoke-Centreon -Object HOST -Action SETINSTANCE -Value "$_hostname;$PollerName"
            }
        }
    }
    end {

    }
}