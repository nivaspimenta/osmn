# Call dependencie
. .\code\main-form-code.ps1

# Main Form
$form = New-Object System.Windows.Forms.Form
$form.Name = 'PGR-Form'
$form.Text = 'OSMN'
$form.Size = '950, 560'
$form.StartPosition = 'CenterScreen'
$form.ShowIcon = $false
$form.FormBorderStyle = 'Sizable'
$form.ForeColor = 'Control'
$form.BackColor = 'ControlDark'
$form.MdiParent = $true


# Show Form
[void]$form.ShowDialog()