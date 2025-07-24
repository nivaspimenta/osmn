# Load Window
$main_window = Build-Window ".\ui\mf_ui.xaml"

# Show the window
[void]$main_window.ShowDialog()