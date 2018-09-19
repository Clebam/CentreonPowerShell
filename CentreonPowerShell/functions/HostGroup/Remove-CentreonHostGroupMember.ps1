<#
    .SYNOPSIS
        Removes the member from a hostgroup
    .DESCRIPTION
        Removes the member from a hostgroup
    .PARAMETER HostGroup
        Name of the hostgroup
    .PARAMETER Member
        Name of the member (HostName)
    .EXAMPLE
        Remove-CentreonHostGroupMember -Hostgroup WebServers -Member WebMdz01, WebCoco01

        Removes WebMdz01 and WebCoco01 from the existing members of the hostgroup WebServers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHostGroupMember {
    [CmdletBinding(SupportsShouldProcess)]
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
        if ($PSCmdlet.ShouldProcess($HostGroup)) {
            foreach ($_hostgroup in $HostGroup) {
                Invoke-Centreon -Object HG -Action DELMEMBER -Value "$_hostgroup;$JoinedMember"
            }
        }
    }
    end {

    }
}