function Get-CentreonCredential {

    $ModuleDirectory = (Get-Module CentreonModule).ModuleBase
    $ConfigFilePath = Join-Path -Path $ModuleDirectory -ChildPath "Config\Config.json"
    $ConfigFile = Get-Content -Raw -Path $ConfigFilePath
    $ConfigObject = ConvertFrom-Json $ConfigFile
    $CentreonSession = [PSCustomObject]@{
        UserName = $ConfigObject.UserName
        Password = $ConfigObject.Password
    }
    $CentreonSession
}