<#
    .SYNOPSIS
        Creates a new dependency
    .DESCRIPTION
        Creates a new dependency
    .PARAMETER Dependency
        Corresponds to the name of the dependency
    .PARAMETER Description
        Corresponds to the description of the dependency
    .PARAMETER Object
        Corresponds to the type of object
    .PARAMETER ObjectName
        Corresponds to the name of the object
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        New-CentreonDependency -Dependency "my dependency" -Description "Any description" -Object HOST -ObjectName "my_host"

        Creates a new instance named "my dependency" with its parameters
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function New-CentreonDependency {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Dependency,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Description,
        [Parameter(Mandatory)]
        [ValidateSet(
            "HOST",
            "HG",
            "SG",
            "SERVICE",
            "META"
        )]
        [string] $Object,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $ObjectName
    )
    if ($PSCmdlet.ShouldProcess($Dependency)) {
        Invoke-Centreon -Object DEP -Action ADD -Value "$Dependency;$Description;$Object;$ObjectName"
    }
}