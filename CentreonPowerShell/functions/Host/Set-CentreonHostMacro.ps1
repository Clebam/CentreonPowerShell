<#
    .SYNOPSIS
        Sets the macros of a host
    .DESCRIPTION
        Sets the macros of a host
    .PARAMETER HostName
        Name of the host
    .PARAMETER MacroName
        Name of the macro
    .PARAMETER MacroValue
        Value of the macro
    .PARAMETER IsPassword
        Define if the value should be considered as password and hidden
    .PARAMETER MacroDescription
        Name of the host
    .EXAMPLE
        Set-CentreonHostMacro -HostName "WebMdz01" -MacroName "Warning" -MacroValue 80 -MacroDescription "Warning threshold"
    .EXAMPLE
        Set-CentreonHostMacro -HostName "WebMdz01" -MacroName "Account" -MacroValue 1234 -MacroDescription "Account Code" -IsPassword
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostMacro {
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $MacroName,
        [string] $MacroValue,
        [switch] $IsPassword,
        [string] $MacroDescription
    )
    if ($IsPassword) {
        $IsPasswordValue = 1
    }
    else {
        $IsPasswordValue = 0
    }
    Invoke-Centreon -Object HOST -Action SETMACRO -Value "$HostName;$MacroName;$MacroValue;$IsPasswordValue;$MacroDescription"
}