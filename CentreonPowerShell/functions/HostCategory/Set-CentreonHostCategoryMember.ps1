<#
.SYNOPSIS
        Sets the member to a host category (REPLACE). If you want to append, use Add-CentreonHostCategoryMember
    .DESCRIPTION
        Sets the member to a host category (REPLACE). If you want to append, use Add-CentreonHostCategoryMember
    .PARAMETER HostCategory
        Name of the host category
    .PARAMETER Member
        Name of the member (HostName or HostTemplate)
    .EXAMPLE
        Set-CentreonHostCategoryMember -HostCategory WebServer_Critical -Member WebMdz01, OS-Linux-SNMP

        Replace all the members of the host category WebServer_Critical by WebMdz01 and OS-Linux-SNMP
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostCategoryMember {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostCategory,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Member
    )
    begin {
        $JoinedMember = $Member -join "|"
    }
    process {
        if ($PSCmdlet.ShouldProcess($HostCategory)) {
            foreach ($_hostcategory in $HostCategory) {
                Invoke-Centreon -Object HC -Action SETMEMBER -Value "$_hostcategory;$JoinedMember"
            }
        }
    }
    end {

    }
}