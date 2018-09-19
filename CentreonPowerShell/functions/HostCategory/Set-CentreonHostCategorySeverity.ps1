<#
    .SYNOPSIS
        Sets a severity on the host category
    .DESCRIPTION
        Sets a severity on the host category
    .PARAMETER HostCategory
        Name of the host category
    .PARAMETER Severity
        Name of the severity
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostSeverity -HostCategory "WebServer_Critical" -Severity "Critical"

        Sets the severity to Critical on the host category WebServer_Critical
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostSeverity {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostCategory,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Severity
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($HostCategory)) {
            foreach ($_hostcategory in $HostCategory) {
                Invoke-Centreon -Object HC -Action SETSEVERITY -Value "$_hostcategory;$Severity"
            }
        }
    }
    end {

    }
}