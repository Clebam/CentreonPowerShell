<#
    .SYNOPSIS
        Removes a host group from the host
    .DESCRIPTION
        Removes a host group from the host
    .PARAMETER HostName
        Name of the host
    .PARAMETER HostGroup
        Name of the Host Group
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonHostHG -HostName "WebMdz01" -HostGroup "Mdz_WebServers"

        Removes the host group Mdz_WebServers from WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHostHG {
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
        foreach ($_hostname in $HostName) {
            Invoke-Centreon -Object HOST -Action DELHOSTGROUP -Value "$_hostname;$HostGroup"
        }
    }
}