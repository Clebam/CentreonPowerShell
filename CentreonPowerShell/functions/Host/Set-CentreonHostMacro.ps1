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
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostMacro -HostName "WebMdz01" -MacroName "Warning" -MacroValue 80 -MacroDescription "Warning threshold"

        Sets the value of the macro "Warning" to 80 on the host WebMdz01 with its description
    .EXAMPLE
        Set-CentreonHostMacro -HostName "WebMdz01" -MacroName "Account" -MacroValue 1234 -MacroDescription "Account Code" -IsPassword

        Sets the value of the macro "Account" to 1234 on WebMdz01. It is set as password, so it will be hidden.
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostMacro {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [Alias("Name")]
        [string[]] $HostName,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $MacroName,
        [string] $MacroValue,
        [switch] $IsPassword,
        [string] $MacroDescription
    )
    begin {
        if ($IsPassword) {
            $IsPasswordValue = 1
        }
        else {
            $IsPasswordValue = 0
        }
    }
    process {
        if ($PSCmdlet.ShouldProcess($HostName)) {
            foreach ($_hostname in $HostName) {
                Invoke-Centreon -Object HOST -Action SETMACRO -Value "$_hostname;$MacroName;$MacroValue;$IsPasswordValue;$MacroDescription"
            }
        }
        if ($PSCmdlet.ShouldProcess($HostName)) {
            foreach ($_hostname in $HostName) {
                Invoke-Centreon -Object HOST -Action SETINSTANCE -Value "$_hostname;$PollerName"
            }
        }
    }
    end {

    }
}