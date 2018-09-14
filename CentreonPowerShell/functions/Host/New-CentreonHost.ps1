<#
    .SYNOPSIS
        Creates a new host in Centreon
    .DESCRIPTION
        Creates a new host in Centreon
    .PARAMETER HostName
        Corresponds to the name of the  (Name)
    .PARAMETER Description
        Corresponds to the description of the host (Alias)
    .PARAMETER HostAddress
        Corresponds to the DNS Name or IP Address of the host
    .PARAMETER HostTemplate
        Name of the HTPL (Host Template)
    .PARAMETER PollerName
        Corresponds to the name of the poller
    .PARAMETER HostGroup
        Corresponds to the hostgroup the host will be member of
    .PARAMETER ApplyTemplate
        Triggers the generation of services linked to the template
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        New-CentreonHost -HostName WebMdz01 -PollerName central

        Creates a host named "WebMdz01" and link it to the poller "central"
    .EXAMPLE
        $HostConfig = @{
            HostName = "WebMdz01"
            Description = "Mamoudzou"
            HostAddress = 192.168.1.100
            HostTemplate = "Centreon-Poller-Custom", "OS-Linux-SNMP"
            PollerName = "central"
            HostGroup = "Monitoring_Servers"
        }
        New-CentreonHost @$HostConfig

        Use splatting to make the config
    .NOTES
        Author: Clebam
        Version: 1.0
    #>
function New-CentreonHost {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [Alias("Name")]
		[string] $HostName,
        [ValidateNotNullOrEmpty()]
        [string] $Description,
        [ValidateNotNullOrEmpty()]
        [string] $HostAddress,
        [ValidateNotNullOrEmpty()]
        [string[]] $HostTemplate,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $PollerName,
        [ValidateNotNullOrEmpty()]
        [string[]] $HostGroup,
        [switch]$ApplyTemplate
    )
    if ($HostTemplate) {$HostTemplate = $HostTemplate -join "|"}
    if ($HostGroup) {$HostGroup = $HostGroup -join "|"}

    if ($PSCmdlet.ShouldProcess($HostName)) {
        Invoke-Centreon -Object HOST -Action ADD -Value "$HostName;$Description;$HostAddress;$HostTemplate;$PollerName;$HostGroup"

        if ($ApplyTemplate) {
            Invoke-Centreon -Object HOST -Action APPLYTPL -Value $HostName
        }
    }
}