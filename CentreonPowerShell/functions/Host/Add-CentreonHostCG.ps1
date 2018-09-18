<#
    .SYNOPSIS
        Adds a contact groups to a host (APPEND). If you want to replace, use Set-CentreonHostCG
    .DESCRIPTION
        Adds a contact groups to a host (APPEND). If you want to replace, use Set-CentreonHostCG
    .PARAMETER HostName
        Name of the host
    .PARAMETER ContactGroup
        Name of the Contact Group
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostCG -HostName "WebMdz01" -ContactGroup "Mdz_Support"

        Add the contact group Mdz_Support to WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Add-CentreonHostCG {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostName,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $ContactGroup
    )
    begin {
      $JoinedContactGroup = $ContactGroup -join "|"
    }
    process {
        if ($PSCmdlet.ShouldProcess($HostName)) {
            foreach ($_hostname in $HostName) {
                Invoke-Centreon -Object HOST -Action ADDCONTACTGROUP -Value "$_hostname;$JoinedContactGroup"
            }
        }
    }
    end {

    }
}