<#
    .SYNOPSIS
        Returns the dependency definition of a dependency
    .DESCRIPTION
        Returns the dependency definition of a dependency
    .PARAMETER Dependency
        Name of the dependency
    .EXAMPLE
        Get-CentreonDependencyDefinition -Depency "my dependency"

        Returns the dependency definition of "my dependency"
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonDependencyDefinition {
    [CmdletBinding()]
    param (
        [string[]] $Dependency
    )
    begin {

    }
    process {
        foreach ($_dependency in $Dependency) {
            Invoke-Centreon -Object DEP -Action LISTDEP -Value "$_dependency"
        }
    }
    end {

    }
}