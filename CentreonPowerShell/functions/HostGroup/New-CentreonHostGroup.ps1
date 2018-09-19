<#
    .SYNOPSIS
        Creates a new hostgroup
    .DESCRIPTION
        Creates a new hostgroup
    .PARAMETER HostGroup
        Corresponds to the name of the hostgroup
    .PARAMETER Description
        Corresponds to the hostgroup description (Alias)
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        New-CentreonHostGroup -HostGroupName "Mamoudzou_Servers" -Description "Servers located in Mamoudzou"

        Creates a new hostgroup name "Mamoudzou_Servers" with its description
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function New-CentreonHostGroup {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $HostGroup,
        [ValidateNotNullOrEmpty()]
        [string] $Description
    )
    if ($PSCmdlet.ShouldProcess($HostGroup)) {
        Invoke-Centreon -Object HG -Action ADD -Value "$HostGroup;$Description"
    }
}