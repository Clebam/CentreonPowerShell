<#
    .SYNOPSIS
        Sets a vendor parameter value
    .DESCRIPTION
        Sets a vendor parameter value
    .PARAMETER Vendor
        Name of the vendor
    .PARAMETER Parameter
        Vendor Parameter to set (! alias = description, description = details)
    .PARAMETER Value
        Value applied to parameter
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonVendor -Vendor "DLink" -Parameter alias -Value "DLink routers and switches"

        Set the parameter alias with a new value on vendor DLink
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonVendorParameter {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Vendor,
        [Parameter(Mandatory)]
        [ValidateSet(
            "name",
            "alias",
            "description"
        )]
        [string] $Parameter,
        [Parameter(Mandatory)]
        $Value
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($Vendor)) {
            foreach ($_vendor in $Vendor) {
                Invoke-Centreon -Object VENDOR -Action SETPARAM -Value "$_vendor;$Parameter;$Value"
            }
        }
    }
    end {

    }
}