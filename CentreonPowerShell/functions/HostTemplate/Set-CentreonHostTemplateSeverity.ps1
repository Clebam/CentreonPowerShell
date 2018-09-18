<#
    .SYNOPSIS
        Sets a severity on the host template
    .DESCRIPTION
        Sets a severity on the host template
    .PARAMETER HostTemplate
        Name of the host template
    .PARAMETER Severity
        Name of the severity
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostTemplateSeverity -HostTemplate "WebServers" -Severity "Critical"

        Sets the severity to Critical on the host template WebServers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostTemplateSeverity {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostTemplate,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Severity
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($HostTemplate)) {
            foreach ($_hosttemplate in $HostTemplate) {
                Invoke-Centreon -Object HTPL -Action SETSEVERITY -Value "$_hosttemplate;$Severity"
            }
        }
    }
    end {

    }
}