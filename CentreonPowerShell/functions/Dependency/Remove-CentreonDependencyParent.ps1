<#
    .SYNOPSIS
        Removes a new dependency parent
    .DESCRIPTION
        Removes a new dependency parent
    .PARAMETER Dependency
        Corresponds to the name of the dependency
    .PARAMETER ObjectName
        Corresponds to the name of the object (can be a hostname)
    .PARAMETER SubObjectName
        Corresponds to the name of the subobject (can be a service name)
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonDependencyParent -Dependency "my dependency" -ObjectName "Host1" -SubObjectName "Service1"

        Creates a new dependency parent named "my dependency" with its parameters
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonDependencyParent {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Dependency,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $ObjectName,
        [string] $SubObjectName
    )
    begin {
        if ($SubObjectName) {
            $Object = "$ObjectName,$SubObjectName"
        }
        else {
            $Object = $ObjectName
        }
    }
    process {
        if ($PSCmdlet.ShouldProcess($Dependency)) {
            foreach ($_dependency in $Dependency) {
                Invoke-Centreon -Object DEP -Action DELPARENT -Value "$_dependency;$Object"
            }
        }
    }
    end {

    }
}