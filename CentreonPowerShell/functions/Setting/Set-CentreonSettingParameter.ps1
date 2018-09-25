<#
    .SYNOPSIS
        Sets a setting parameter value
    .DESCRIPTION
        Sets a setting parameter value
    .PARAMETER Parameter
        Setting Parameter to set
    .PARAMETER Value
        Value applied to parameter
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonSettingParameter -Parameter "mailer_path_bin" -Value "/bin/mailx"

        Set the parameter mailer_path_bin with a new value
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonSettingParameter {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateSet(
            "broker",
            "broker_correlator_script",
            "centstorage",
            "debug_auth",
            "debug_ldap_import",
            "debug_nagios_import",
            "debug_path",
            "debug_rrdtool",
            "enable_autologin",
            "enable_gmt",
            "enable_logs_sync",
            "enable_perfdata_sync",
            "gmt",
            "interval_length",
            "mailer_path_bin",
            "nagios_path_img",
            "perl_library_path",
            "rrdtool_path_bin",
            "snmpttconvertmib_path_bin",
            "snmptt_unknowntrap_log_file"
        )]
        [string] $Parameter,
        [Parameter(Mandatory)]
        $Value
    )
    if ($PSCmdlet.ShouldProcess($Parameter)) {
        Invoke-Centreon -Object SETTINGS -Action SETPARAM -Value "$Parameter;$Value"
    }
}