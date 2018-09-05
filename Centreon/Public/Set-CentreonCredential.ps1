function Set-CentreonCredential {
    param (
        [string] $UserName,
        [string] $Password
    )
    $ModuleDirectory = (Get-Module CentreonModule).ModuleBase
    $ConfigFilePath = Join-Path -Path $ModuleDirectory -ChildPath "Config\Config.json"
    $ConfigFile = Get-Content -Raw -Path $ConfigFilePath
    $ConfigObject = ConvertFrom-Json $ConfigFile
    $ConfigObject.UserName = $UserName
    $ConfigObject.Password = $Password
    $ConfigObject | ConvertTo-Json | Set-Content $ConfigFilePath -Force
}