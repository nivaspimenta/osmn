Add-Type -AssemblyName PresentationFramework

# Create a simple WPF form (Window)
[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="Button Click Example" Height="200" Width="300">
    <StackPanel HorizontalAlignment="Center" VerticalAlignment="Center">
        <Button Name="Button_1" Content="Button 1" Margin="5" Width="100"/>
        <Button Name="Button2" Content="Button 2" Margin="5" Width="100"/>
        <Button Name="Button3" Content="Button 3" Margin="5" Width="100"/>
    </StackPanel>
</Window>
"@

# Load XAML
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

# Access buttons
$button1 = $window.FindName("Button_1")
$button2 = $window.FindName("Button2")
$button3 = $window.FindName("Button3")

# Shared event handler
$clickHandler = {
    param($sender)
    [System.Windows.MessageBox]::Show("You clicked: $($sender.Content)")
}

# Register Click event for all buttons
$button1.Add_Click($clickHandler)
$button2.Add_Click($clickHandler)
$button3.Add_Click($clickHandler)

# Show the window
$window.ShowDialog() | Out-Null