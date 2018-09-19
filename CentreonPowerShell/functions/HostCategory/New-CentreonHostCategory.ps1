<#
    .SYNOPSIS
        Creates a new host category in Centreon
    .DESCRIPTION
        Creates a new host category in Centreon
    .PARAMETER HostCategory
        Corresponds to the name of the host category (Name)
    .PARAMETER Description
        Corresponds to the description of the host (Alias)
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        New-CentreonHostCategory -HostCategory WebServer_Critical

        Creates a host category named "WebServer_Critical"
    .NOTES
        Author: Clebam
        Version: 1.0
    #>
function New-CentreonHostCategory {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $HostCategory,
        [ValidateNotNullOrEmpty()]
        [string] $Description
    )

    if ($PSCmdlet.ShouldProcess($HostCategory)) {
        Invoke-Centreon -Object HC -Action ADD -Value "$HostCategory;$Description"
    }
}