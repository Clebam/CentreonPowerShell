<#
    .SYNOPSIS
        Sets a host group bound to a host (REPLACE). If you want to append, use Add-CentreonHostHG
    .DESCRIPTION
        Sets a host group bound to a host (REPLACE). If you want to append, use Add-CentreonHostHG
    .PARAMETER HostName
        Name of the host
    .PARAMETER HostGroup
        Name of the Host Group
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostHG -HostName "WebMdz01" -HostGroup "Mdz_WebServers"

        Replaces the host groups bound to WebMdz01 by Mdz_WebServers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostHG {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [Alias("Name")]
		[string[]] $HostName,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostGroup
    )
    $HostGroup = $HostGroup -join "|"
    if ($PSCmdlet.ShouldProcess($HostName)) {
        Invoke-Centreon -Object HOST -Action SETHOSTGROUP -Value "$HostName;$HostGroup"
    }
}