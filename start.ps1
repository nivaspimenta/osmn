# Clear the console for this session
Clear-Host

# Dependencies
Add-Type -AssemblyName PresentationFramework

function Build-Window {
    [CmdletBinding()]
    param([Parameter(Mandatory=$true, HelpMessage="Path to load the window from a xaml file.")][ValidateNotNullOrEmpty()] $XMLPath)

    begin {
        # Nada //TODO Check Path - Add Try-Cath Exception
    }

    process {
        # Load the XAML from external file
        $xamlPath = Join-Path -Path $PSScriptRoot -ChildPath $XMLPath
        $xamlContent = Get-Content $xamlPath -Raw

        # Load XAML
        $reader = [System.Xml.XmlReader]::Create([System.IO.StringReader]$xamlContent)
        $window = [Windows.Markup.XamlReader]::Load($reader)
    }

    End {
        return $window
    }

}

# Call script
. .\code\mf_code.ps1