Add-Type -AssemblyName PresentationFramework

# Load the XAML from external file
$xamlPath = Join-Path -Path $PSScriptRoot -ChildPath "..\ui\mf_ui.xaml"
$xamlContent = Get-Content $xamlPath -Raw

# Load XAML
$reader = [System.Xml.XmlReader]::Create([System.IO.StringReader]$xamlContent)
$window = [Windows.Markup.XamlReader]::Load($reader)


# Show the window
[void]$window.ShowDialog()