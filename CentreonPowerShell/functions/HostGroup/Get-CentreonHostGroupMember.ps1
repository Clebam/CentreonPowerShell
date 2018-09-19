<#
    .SYNOPSIS
        Returns the members of a hostgroup
    .DESCRIPTION
        Returns the members of a hostgroup
    .PARAMETER HostGroup
        Name of the hostgroup
    .EXAMPLE
        Get-CentreonHostGroupMember -Hostgroup WebServers

        Returns all the members of the hostgroup WebServers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostGroupMember {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostGroup
    )
    begin {

    }
    process {
        foreach ($_hostgroup in $HostGroup) {
            $PSObject = [PSCustomObject]@{
                HostGroup = $_hostgroup -as [string]
                HostName  = Invoke-Centreon -Object HG -Action GETMEMBER -Value $_hostgroup | Select-Object -ExpandProperty "name"
            }
            $PSObject
        }
    }
    end {

    }
}