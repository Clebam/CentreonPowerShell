<#
    .SYNOPSIS
        !!! The function has currently no use !!!
    .DESCRIPTION
        !!! The function has currently no use !!!
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function New-CentreonSession {  
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        $UserName,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        $Password,
        [switch]$Keep
    )
    $CentreonSession = @{
            UserName = $UserName
            Password = $Password
    }
    $CentreonSession = $UserName
    if ($Keep) {
        $global:PSDefaultParameterValues['Get-CentreonHost:CentreonSession'] = $CentreonSession
        $PSDefaultParameterValues = $global:PSDefaultParameterValues.Clone()
    }
    $CentreonSession  
}