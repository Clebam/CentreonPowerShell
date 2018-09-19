<#
.SYNOPSIS
        Sets the member to a hostgroup (REPLACE). If you want to append, use Add-CentreonHostGroupMember
    .DESCRIPTION
        Sets the member to a hostgroup (REPLACE). If you want to append, use Add-CentreonHostGroupMember
    .PARAMETER HostGroup
        Name of the hostgroup
    .PARAMETER Member
        Name of the member (HostName)
    .EXAMPLE
        Set-CentreonHostGroupMember -Hostgroup WebServers -Member WebMdz01, WebCoco01

        Replace all the members of the hostgroup WebServers by WebMdz01 and WebCoco01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostGroupMember {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostGroup,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Member
    )
    begin {
        $JoinedMember = $Member -join "|"
    }
    process {
        foreach ($_hostgroup in $HostGroup) {
            Invoke-Centreon -Object HG -Action SETMEMBER -Value "$_hostgroup;$JoinedMember"
        }
    }
    end {

    }
}