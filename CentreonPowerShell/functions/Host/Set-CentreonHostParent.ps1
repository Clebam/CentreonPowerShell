<#
    .SYNOPSIS
        Sets a parent to a host (REPLACE). If you want to append, use Add-CentreonHostParent
    .DESCRIPTION
        Sets a parent to a host (REPLACE). If you want to append, use Add-CentreonHostParent
    .PARAMETER HostName
        Name of the host
    .PARAMETER ParentName
        Name of the parent
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostParent -HostName "WebMdz01" -ParentName "GWMdz01","GWMdz02"

        This replace existing parents by GWMdz01 and GWMdz02 as parents of WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostParent {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [Alias("Name")]
        [string[]] $HostName,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $ParentName
    )

    begin {
        $ParentName = $ParentName -join "|"
    }
    process {
        if ($PSCmdlet.ShouldProcess($HostName)) {
            foreach ($_hostname in $HostName) {
                Invoke-Centreon -Object HOST -Action SETPARENT -Value "$_hostname;$ParentName"
            }
        }
    }
    end {

    }
}