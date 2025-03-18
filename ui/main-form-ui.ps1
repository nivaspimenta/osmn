# Call dependencie
. .\code\main-form-code.ps1

# Main Form
$form = New-Object System.Windows.Forms.Form
$form.Name = 'PGR-Form'
$form.Text = 'OSMN'
$form.Size = '950, 560'
$form.StartPosition = 'CenterScreen'
$form.ShowIcon = $false
$form.MaximizeBox = $false
$form.FormBorderStyle = 'FixedSingle'
$form.ForeColor = 'Control'
$form.BackColor = 'ControlDark'

# Button - Programs
$btn_programs = New-Object System.Windows.Forms.Button
$btn_programs.Name = 'btn-programs'
$btn_programs.Location = '0,0'
$btn_programs.Size = '50, 50'
$btn_programs.Text = 'P'
$btn_programs.FlatStyle = 'Flat'
$btn_programs.ForeColor = 'Black'
$btn_programs.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$btn_programs.Add_MouseEnter({
    $btn_programs.Size = '200, 50'
    $btn_programs.Text = 'Programs'
 })
$btn_programs.Add_MouseLeave({
    $btn_programs.Size = '50, 50'
    $btn_programs.Text = 'P'
})
$btn_programs.Add_Click({  })
$form.Controls.Add($btn_programs)

# Button - Accounts
$btn_account = New-Object System.Windows.Forms.Button
$btn_account.Name = 'btn-account'
$btn_account.Location = '0, 50'
$btn_account.Size = '50, 50'
$btn_account.Text = 'A'
$btn_account.FlatStyle = 'Flat'
$btn_account.ForeColor = 'Black'
$btn_account.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$btn_account.Add_MouseEnter({
    $btn_account.Size = '200, 50'
    $btn_account.Text = 'Accounts'
 })
$btn_account.Add_MouseLeave({
    $btn_account.Size = '50, 50'
    $btn_account.Text = 'A'
})
$btn_account.Add_Click({  })
$form.Controls.Add($btn_account)

# Button - System Settings
$btn_ssettings = New-Object System.Windows.Forms.Button
$btn_ssettings.Name = 'btn-ssettings'
$btn_ssettings.Location = '0, 100'
$btn_ssettings.Size = '50, 50'
$btn_ssettings.Text = 'S'
$btn_ssettings.FlatStyle = 'Flat'
$btn_ssettings.ForeColor = 'Black'
$btn_ssettings.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$btn_ssettings.Add_MouseEnter({
    $btn_ssettings.Size = '200, 50'
    $btn_ssettings.Text = 'System'
 })
$btn_ssettings.Add_MouseLeave({
    $btn_ssettings.Size = '50, 50'
    $btn_ssettings.Text = 'S'
})
$btn_ssettings.Add_Click({  })
$form.Controls.Add($btn_ssettings)

# Button - Settings
$btn_settings = New-Object System.Windows.Forms.Button
$btn_settings.Name = 'btn-settings'
$btn_settings.Location = '0, 100'
$btn_settings.Size = '50, 50'
$btn_settings.Text = 'S'
$btn_settings.FlatStyle = 'Flat'
$btn_settings.ForeColor = 'Black'
$btn_settings.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$btn_settings.Add_MouseEnter({
    $btn_settings.Size = '200, 50'
    $btn_settings.Text = 'Settings'
 })
$btn_settings.Add_MouseLeave({
    $btn_settings.Size = '50, 50'
    $btn_settings.Text = 'S'
})
$btn_settings.Add_Click({  })
$form.Controls.Add($btn_settings)

# Show Form
[void]$form.ShowDialog()