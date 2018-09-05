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