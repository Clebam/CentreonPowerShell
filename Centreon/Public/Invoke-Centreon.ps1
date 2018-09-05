function Invoke-Centreon {
    param(
        $Option,
        $Action,
        $Value
    )
    $ModuleDirectory = (Get-Module CentreonModule).ModuleBase
    $ConfigFilePath = Join-Path -Path $ModuleDirectory -ChildPath "Config\Config.json"
    $ConfigFile = Get-Content -Raw -Path $ConfigFilePath
    $ConfigObject = ConvertFrom-Json $ConfigFile
    $clapi = $ConfigObject.centreonbinary
    $CentreonSession = Get-CentreonCredential
    $arguments = "-u $($CentreonSession.UserName) -p $($CentreonSession.Password)"
    
    if ($Option) {
        $arguments += " -o $Option"
    }

    if ($Action) {
        $arguments += " -a $Action"
    }

    if ($Value) {
        $arguments += ' -v "' + $Value + '"'
    }
    $Process = Invoke-Process -Process $clapi -Arguments $arguments

    if ($Process.ExitCode -eq 0) {
        $Process.StandardOutput.ReadToEnd() | ConvertFrom-Csv -Delimiter ";"
    }
    else {
        throw "An error occured $($Process.StandardOutput.ReadToEnd())"
    }
}