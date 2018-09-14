<#
    .SYNOPSIS
        Removes a template bound to a host
    .DESCRIPTION
        Removes a template bound to a host
    .PARAMETER HostName
        Name of the host
    .PARAMETER HostTemplate
        Name of the Host Template
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonHtpl -HostName "WebMdz01" -HostTemplate "OS-Linux-SNMP-Custom", "OS-Linux-SNMP"

        Removes the templates OS-Linux-SNMP-Custom and OS-Linux-SNMP from the host WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHtpl {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [Alias("Name")]
        [string[]] $HostName,
        [ValidateNotNullOrEmpty()]
        [string[]] $HostTemplate
    )
    begin {
        $HostTemplate = $HostTemplate -join "|"
    }
    process {
        if ($PSCmdlet.ShouldProcess($HostName)) {
            foreach ($_hostname in $HostName) {
                Invoke-Centreon -Object HOST -Action DELTEMPLATE -Value "$_hostname;$HostTemplate"
            }
        }
    }
    end {

    }
}