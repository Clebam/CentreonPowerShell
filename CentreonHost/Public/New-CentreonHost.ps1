<#
    .SYNOPSIS
        Creates a new host in Centreon
    .DESCRIPTION
        Creates a new host in Centreon
    .PARAMETER HostName
        Corresponds to the name of the  (Name)
    .PARAMETER Description
        Corresponds to the description of the host (Alias)
    .PARAMETER HostAddress
        Corresponds to the DNS Name or IP Address of the host
    .PARAMETER Template
        Corresponds to the template name to apply (Add many with "Tpl1|Tpl2|Tpl3")
    .PARAMETER PollerName
        Corresponds to the name of the poller
    .PARAMETER HostGroup
        Corresponds to the hostgroup the host will be member of. (Add many with "Grp1|Grp2|Grp3")
    .PARAMETER ApplyTemplate
        Triggers the generation of services linked to the template
    .EXAMPLE
        New-CentreonHost -HostName MyHost -PollerName central
    .EXAMPLE
        $HostConfig = @{
            HostName = "CentreonMdz"
            Description = "Mamoudzou"
            HostAddress = 192.168.1.100
            Template = "Centreon-Poller-Custom"
            PollerName = "central"
            HostGroup = "Monitoring_Servers"
        }
        New-CentreonHost @$HostConfig
    .NOTES
        Author: Clebam
        Version: 1.0
    #>
function New-CentreonHost {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName,
        [ValidateNotNullOrEmpty()]
        [string] $Description,
        [ValidateNotNullOrEmpty()]
        [string] $HostAddress,
        [ValidateNotNullOrEmpty()]
        [string] $Template,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $PollerName,
        [ValidateNotNullOrEmpty()]
        [string] $HostGroup,
        [switch]$ApplyTemplate
    )

    $Value = "$HostName;$Description;$HostAddress;$Template;$PollerName;$HostGroup"
    Invoke-Centreon -CentreonSession $CentreonSession -Object HOST -Action ADD -Value $Value
    if ($ApplyTemplate) {
        Invoke-Centreon -CentreonSession $CentreonSession -Object HOST -Action APPLYTPL -Value $HostName
    }
}