<#
    .SYNOPSIS
        Sets the macros of a host template
    .DESCRIPTION
        Sets the macros of a host template
    .PARAMETER HostTemplate
        Name of the host template
    .PARAMETER MacroName
        Name of the macro
    .PARAMETER MacroValue
        Value of the macro
    .PARAMETER IsPassword
        Define if the value should be considered as password and hidden
    .PARAMETER MacroDescription
        Description of the Macro
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonHostTemplateMacro -HostTemplate "WebServers" -MacroName "Warning" -MacroValue 80 -MacroDescription "Warning threshold"

        Sets the value of the macro "Warning" to 80 on the host template WebServers with its description
    .EXAMPLE
        Set-CentreonHostTemplateMacro -HostTemplate "WebServers" -MacroName "Account" -MacroValue 1234 -MacroDescription "Account Code" -IsPassword

        Sets the value of the macro "Account" to 1234 on the host template WebServers. It is set as password, so it will be hidden.
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonHostTemplateMacro {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostTemplate,
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
        if ($PSCmdlet.ShouldProcess($HostTemplate)) {
            foreach ($_hosttemplate in $HostTemplate) {
                Invoke-Centreon -Object HTPL -Action SETMACRO -Value "$_hosttemplate;$MacroName;$MacroValue;$IsPasswordValue;$MacroDescription"
            }
        }
    }
    end {

    }
}