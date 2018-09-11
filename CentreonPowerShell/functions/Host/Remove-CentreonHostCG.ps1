<#
    .SYNOPSIS
        Removes a contact group from a host
    .DESCRIPTION
        Removes a contact group from a host
    .PARAMETER HostName
        Name of the host
    .PARAMETER ContactGroup
        Name of the Contact Group
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonHostCG -HostName "WebMdz01" -ContactGroup "Mdz_Support"

        Removes the contact group Mdz_Support from the host WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHostCG {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [Alias("Name")]
		[string] $HostName,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $ContactGroup
    )
    $ContactGroup = $ContactGroup -join "|"
    if ($PSCmdlet.ShouldProcess($HostName)) {
        Invoke-Centreon -Object HOST -Action DELCONTACTGROUP -Value "$HostName;$ContactGroup"
    }
}