<#
    .SYNOPSIS
        Returns a host parameter value
    .DESCRIPTION
        Returns a host parameter value
    .PARAMETER HostName
        Name of the host
    .PARAMETER Parameter
        Host Parameter to get
    .PARAMETER All
        Returns the value of all parameters
    .EXAMPLE
        Get-CentreonHostParameter -HostName "WebMdz01" -Parameter alias

        Returns the value of the parameter alias of the host WebMdz01
    .EXAMPLE
        Get-CentreonHostParameter -HostName "WebMdz01" -All

        Returns the value of all parameters of the host WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostParameter {
    [CmdletBinding(DefaultParameterSetName = "Default")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostName,
        [Parameter(Mandatory, ParameterSetName = "Default")]
        [ValidateSet("2d_coords",
            "3d_coords",
            "action_url",
            "activate",
            "active_checks_enabled",
            "address",
            "alias",
            "check_command",
            "check_command_arguments",
            "check_interval",
            "check_freshness",
            "check_period",
            #"checks_enabled",
            "contact_additive_inheritance",
            "cg_additive_inheritance",
            "event_handler",
            "event_handler_arguments",
            "event_handler_enabled",
            "first_notification_delay",
            "flap_detection_enabled",
            "flap_detection_options",
            "icon_image",
            "icon_image_alt",
            "max_check_attempts",
            "name",
            #"normal_check_interval",
            "notes",
            "notes_url",
            "notifications_enabled",
            "notification_interval",
            "notification_options",
            "notification_period",
            "obsess_over_host",
            "passive_checks_enabled",
            "process_perf_data",
            "retain_nonstatus_information",
            "retain_status_information",
            "retry_check_interval",
            "snmp_community",
            "snmp_version",
            "stalking_options",
            "statusmap_image",
            #"vrml_image",
            "host_notification_options"
        )]
        [string[]] $Parameter,
        [Parameter(Mandatory, ParameterSetName = "All")]
        [switch] $All
    )
    begin {
        if ($All) {
            [string[]]$Parameter = (Get-Variable "Parameter").Attributes.ValidValues
        }
    }
    process {
        $JoinedParameter = $Parameter -join "|"
        foreach ($_hostname in $HostName) {
            $PSObject = [PSCustomObject]@{
                HostName  = $_hostname -as [string]
                Parameter = [pscustomobject]((Invoke-Centreon -Object HOST -Action GETPARAM -Value "$_hostname;$JoinedParameter" -NonCsvOutput) -replace ":", "=" | Sort-Object | ConvertFrom-StringData)
            }
            $PSObject
        }
    }
    end {

    }
}