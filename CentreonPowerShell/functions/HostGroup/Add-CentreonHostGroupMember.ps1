<#
.SYNOPSIS
        Adds the member to a hostgroup (APPEND). If you want to replace, use Set-CentreonHostGroupMember
    .DESCRIPTION
        Adds the member to a hostgroup (APPEND). If you want to replace, use Set-CentreonHostGroupMember
    .PARAMETER HostGroup
        Name of the hostgroup
    .PARAMETER Member
        Name of the member (HostName)
    .EXAMPLE
        Add-CentreonHostGroupMember -Hostgroup WebServers -Member WebMdz01, WebCoco01

        Adds WebMdz01 and WebCoco01 to the existing members of the hostgroup WebServers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Add-CentreonHostGroupMember {
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
            Invoke-Centreon -Object HG -Action ADDMEMBER -Value "$_hostgroup;$JoinedMember"
        }
    }
    end {

    }
}