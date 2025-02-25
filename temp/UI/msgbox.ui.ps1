param ([String]$title, [String]$message)

# Main Form
$form = New-Object System.Windows.Forms.Form
$form.Name = 'MSG-form'
$form.Text = $title
$form.Size = '300, 140'
$form.StartPosition = 'CenterScreen'
$form.ShowIcon = $false
$form.MaximizeBox = $false
$form.FormBorderStyle = 'FixedSingle'
$form.ForeColor = 'Control'
$form.BackColor = 'ControlDark'

# Label - Search
$lbl_message = New-Object System.Windows.Forms.Label
$lbl_message.Name = 'lbl-message'
$lbl_message.Text = $message
$lbl_message.Size = '260, 20'
$lbl_message.Location = '10, 35'
$lbl_message.ForeColor = 'Black'
$form.Controls.Add($lbl_message)

# Button - OK
$btn_ok = New-Object System.Windows.Forms.Button
$btn_ok.Name = 'btn-ok'
$btn_ok.Text = 'OK'
$btn_ok.Size = '60, 25'
$btn_ok.ForeColor = 'Black'
$btn_ok.Location = '120, 65'
$btn_ok.FlatStyle = 'Flat'
$btn_ok.Add_Click({ 
    [void]$form.Close()
 })
$form.Controls.Add($btn_ok)

[void]$form.ShowDialog()