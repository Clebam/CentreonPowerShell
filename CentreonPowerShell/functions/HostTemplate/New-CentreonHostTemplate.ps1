<#
    .SYNOPSIS
        Creates a new host template (Htpl) in Centreon
    .DESCRIPTION
        Creates a new host template (Htpl) in Centreon
    .PARAMETER HostTemplate
        Corresponds to the name of the host template (Name)
    .PARAMETER Description
        Corresponds to the description of the host template (Alias)
    .PARAMETER HostAddress
        Corresponds to the DNS Name or IP Address on the host template
    .PARAMETER ParentHostTemplate
        Name of the parent host template
    .PARAMETER PollerName
        Corresponds to the name of the poller
    .PARAMETER HostGroup
        Corresponds to the hostgroup the host template will be member of
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        New-CentreonHostTemplate -HostTemplate WebServers

        Creates a host template  named "WebMdz01" and link it to the poller "central"
    .EXAMPLE
        $HostConfig = @{
            HostTemplate = "WebServers"
            Description = "This is webserver temlate"
            HostAddress = 192.168.1.100
            HostTemplate = "App-MySQL-DB", "OS-Linux-SNMP"
            PollerName = ""
            HostGroup = "Dev_Servers"
        }
        New-CentreonHostTemplate @$HtplConfig

        Use splatting to make the config more readable
    .NOTES
        Author: Clebam
        Version: 1.0
    #>
function New-CentreonHostTemplate {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $HostTemplate,
        [ValidateNotNullOrEmpty()]
        [string] $Description,
        [ValidateNotNullOrEmpty()]
        [string] $HostAddress,
        [ValidateNotNullOrEmpty()]
        [string[]] $ParentHostTemplate,
        [ValidateNotNullOrEmpty()]
        [string] $PollerName,
        [ValidateNotNullOrEmpty()]
        [string[]] $HostGroup
    )
    if ($ParentHostTemplate) {$JoinedParentHostTemplate = $ParentHostTemplate -join "|"}
    if ($HostGroup) {$JoinedHostGroup = $HostGroup -join "|"}

    if ($PSCmdlet.ShouldProcess($HostTemplate)) {
        Invoke-Centreon -Object HTPL -Action ADD -Value "$HostTemplate;$Description;$HostAddress;$JoinedParentHostTemplate;$PollerName;$JoinedHostGroup"
    }
}