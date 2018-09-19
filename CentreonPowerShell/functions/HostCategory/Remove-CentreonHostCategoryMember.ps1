<#
    .SYNOPSIS
        Removes the member from a host category
    .DESCRIPTION
        Removes the member from a host category
    .PARAMETER HostCategory
        Name of the host category
    .PARAMETER Member
        Name of the member (HostName and HostTemplate)
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonHostCategoryMember -HostCategory WebServer_Critical -Member WebMdz01, OS-Linux-SNMP

        Removes WebMdz01 and OS-Linux-SNMP from the existing members of the hostgroup WebServer_Critical
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHostCategoryMember {
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
                Invoke-Centreon -Object HC -Action DELMEMBER -Value "$_hostcategory;$JoinedMember"
            }
        }
    }
    end {

    }
}