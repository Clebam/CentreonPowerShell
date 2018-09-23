<#
    .SYNOPSIS
        Removes a macro of a host template
    .DESCRIPTION
        Removes a macro of a host template
    .PARAMETER HostTemplate
        Name of the host template
    .PARAMETER MacroName
        Name of the macro
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonHostTemplateMacro -HostTemplate "WebServers" -MacroName "Warning"

        Remove the macro named Warning from the host template WebsServers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHostTemplateMacro {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostTemplate,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $MacroName
    )

    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($HostTemplate)) {
            foreach ($_hosttemplate in $HostTemplate) {
                Invoke-Centreon -Object HTPL -Action DELMACRO -Value "$_hosttemplate;$MacroName"
            }
        }
    }
    end {

    }
}