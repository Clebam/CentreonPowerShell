<#
    .SYNOPSIS
        Sets a severity on the host
    .DESCRIPTION
        Sets a severity on the host
    .PARAMETER HostName
        Name of the host
    .PARAMETER Severity
        Name of the severity
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostSeverity -HostName "WebMdz01" -Severity "Critical"

        Sets the severity to Critical on the host WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostSeverity {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [Alias("Name")]
		[string] $HostName,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Severity
    )
    if ($PSCmdlet.ShouldProcess($HostName)) {
        Invoke-Centreon -Object HOST -Action SETSEVERITY -Value "$HostName;$Severity"
    }
}