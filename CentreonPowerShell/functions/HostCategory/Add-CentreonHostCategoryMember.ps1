<#
.SYNOPSIS
        Adds the member to a host category (APPEND). If you want to replace, use Set-CentreonHostCategoryMember
    .DESCRIPTION
        Adds the member to a host category (APPEND). If you want to replace, use Set-CentreonHostCategoryMember
    .PARAMETER HostCategory
        Name of the host category
    .PARAMETER Member
        Name of the member (HostName or HostTemplate)
    .EXAMPLE
        Add-CentreonHostCategoryMember -HostCategory WebServer_Critical -Member WebMdz01, OS-Linux-SNMP

        Adds WebMdz01 and OS-Linux-SNMP to the existing members of the hostgroup WebServer_Critical
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Add-CentreonHostCategoryMember {
    [CmdletBinding()]
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
        foreach ($_hostcategory in $HostCategory) {
            Invoke-Centreon -Object HC -Action ADDMEMBER -Value "$_hostcategory;$JoinedMember"
        }
    }
    end {

    }
}