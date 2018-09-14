<#
    .SYNOPSIS
        Unset the severity on the host
    .DESCRIPTION
        Unset the severity on the host
    .PARAMETER HostName
        Name of the host
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Clear-CentreonHostSeverity -HostName "WebMdz01"

        Unsets the severity on the host WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Clear-CentreonHostSeverity {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [Alias("Name")]
        [string[]] $HostName
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($HostName)) {
            foreach ($_hostname in $HostName) {
                Invoke-Centreon -Object HOST -Action UNSETSEVERITY -Value "$_hostname"
            }
        }
    }
    end {

    }
}