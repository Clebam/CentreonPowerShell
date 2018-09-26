<#
    .SYNOPSIS
        Sets a instance parameter value
    .DESCRIPTION
        Sets a instance parameter value
    .PARAMETER Instance
        Name of the instance
    .PARAMETER Parameter
        Trap Parameter to set
    .PARAMETER Value
        Value applied to parameter
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonInstance -Instance "PollerTest" -Parameter ssh_port -Value "3322"

        Set the parameter ssh-port with a new value on trap PollerTest
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonTrapParameter {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Instance,
        [Parameter(Mandatory)]
        [ValidateSet(
            "name",
            "localhost",
            "ns_ip_address",
            "ns_activate",
            "init_script",
            "nagios_bin",
            "nagiostats_bin",
            "ssh_port",
            "centreonbroker_cfg_path",
            "centreonbroker_module_path"
        )]
        [string] $Parameter,
        [Parameter(Mandatory)]
        $Value
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($Instance)) {
            foreach ($_instance in $Instance) {
                Invoke-Centreon -Object INSTANCE -Action SETPARAM -Value "$_instance;$Parameter;$Value"
            }
        }
    }
    end {

    }
}