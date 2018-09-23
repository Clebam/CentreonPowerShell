$moduleRoot = (Resolve-Path "$PSScriptRoot\..\..").Path
function Get-ScriptFunction {
    PARAM(
        [ValidateNotNullOrEmpty()]
        $ScriptPath
    )

    $AST = [System.Management.Automation.Language.Parser]::ParseFile($ScriptPath, [ref]$null, [ref]$Null)
    $OutputParameter = @();

    foreach ($BlockName in @("BeginBlock", "ProcessBlock", "EndBlock")) {
        $CurrentBlock = $AST.$BlockName;
        foreach ($Statement in $CurrentBlock.Statements) {
            $Extent = $Statement.Extent.ToString();
            if ([String]::IsNullOrWhiteSpace($Statement.Name) -Or $Extent -inotmatch ('function\W+(?<name>{0})' -f $Statement.Name)) {
                continue;
            }
            if ($Statement.Name) {
                $OutputParameter += $Statement.Name;
            }
        }
    }
    return $OutputParameter;
}

Describe "Verifying naming of module files and functions" {
    Context "Validating PS1 Script files" {
        $allFiles = Get-ChildItem -Path $moduleRoot\.\functions -Recurse -Filter "*.ps1"

        foreach ($file in $allFiles) {
            $name = $file.Name
            $BaseName = $file.BaseName
            It "[$name] Should contain a unique function with its name" {
                $FoundFunctions = Get-ScriptFunction -ScriptPath $file.FullName
                $FoundFunctions.Count | Should Be 1
                $FoundFunctions | Should Be $BaseName
            }
        }
    }
}