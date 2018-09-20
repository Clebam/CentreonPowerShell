<#
    .SYNOPSIS
        Sets a hostgroup parameter value
    .DESCRIPTION
        Sets a hostgroup parameter value
    .PARAMETER HostGroup
        Name of the hostgroup
    .PARAMETER Parameter
        Host Parameter to set
    .PARAMETER Value
        Value applied to parameter
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostGroupParameter -HostGroup "WebServers" -Parameter alias -Value "WebServer located in Mamoudzou"

        Set the parameter alias with a new value on hostgroup WebServers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostGroupParameter {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostGroup,
        [Parameter(Mandatory)]
        [ValidateSet("action_url",
            "activate",
            "alias",
            "comment",
            "icon_image",
            "map_icon_image",
            "name",
            "notes",
            "notes_url"
        )]
        [string] $Parameter,
        [Parameter(Mandatory)]
        $Value
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($HostGroup)) {
            foreach ($_hostgroup in $HostGroup) {
                Invoke-Centreon -Object HOST -Action SETPARAM -Value "$_hostgroup;$Parameter;$Value"
            }
        }
    }
    end {

    }
}