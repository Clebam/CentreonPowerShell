<#
    .SYNOPSIS
        Removes a macro of a host
    .DESCRIPTION
        Removes a macro of a host
    .PARAMETER HostName
        Name of the host
    .PARAMETER MacroName
        Name of the macro
    .EXAMPLE
        Remove-CentreonHostMacro -HostName "WebMdz01" -MacroName "Warning"
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHostMacro {
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $MacroName
    )
    Invoke-Centreon -Object HOST -Action DELMACRO -Value "$HostName;$MacroName"
}