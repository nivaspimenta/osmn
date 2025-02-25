# Call dependencies
. .\code\main.code.ps1

# Main Form
$form = New-Object System.Windows.Forms.Form
$form.Name = 'PGR-Form'
$form.Text = 'OSMN - F'
$form.Size = '950, 560'
$form.StartPosition = 'CenterScreen'
$form.ShowIcon = $false
$form.MaximizeBox = $false
$form.FormBorderStyle = 'FixedSingle'
$form.ForeColor = 'Control'
$form.BackColor = 'ControlDark'

# DataGridView - Grid
$dgv = New-Object System.Windows.Forms.DataGridView
$dgv.Name = 'dgv-grid'
$dgv.Location = '10, 10'
$dgv.Size = '750, 500'
$dgv.AllowUserToAddRows = $false
$dgv.RowHeadersVisible = $false
$dgv.ForeColor = 'Black'
$dgv.RowHeadersBorderStyle = 'Single'
$dgv.AllowUserToResizeRows = $false
$dgv.AllowUserToResizeColumns = $false
$dgv.AllowUserToDeleteRows = $false
$dgv.AllowUserToOrderColumns = $false
$dgv.ColumnHeadersBorderStyle = 'Single'
$dgv.SelectionMode = 'FullRowSelect'
$dgv.RowHeadersWidthSizeMode = 'DisableResizing'
$dgv.ScrollBars = 'Vertical'
$dgv.ReadOnly = $true
$form.Controls.Add($dgv)

# Button - Services
$btn_services = New-Object System.Windows.Forms.Button
$btn_services.Name = 'btn-services'
$btn_services.Location = '770, 10'
$btn_services.Size = '150, 30'
$btn_services.Text = 'Services'
$btn_services.FlatStyle = 'Flat'
$btn_services.ForeColor = 'Black'
$btn_services.Add_Click({ Show-Services })
$form.Controls.Add($btn_services)

# Button - Log
$btn_log = New-Object System.Windows.Forms.Button
$btn_log.Name = 'btn-log'
$btn_log.Location = '770, 50'
$btn_log.Size = '150, 30'
$btn_log.Text = 'Logs'
$btn_log.FlatStyle = 'Flat'
$btn_log.ForeColor = 'Black'
$form.Controls.Add($btn_log)

# Button - Programs
$btn_programs = New-Object System.Windows.Forms.Button
$btn_programs.Name = 'btn-prog'
$btn_programs.Location = '770, 90'
$btn_programs.Size = '150, 30'
$btn_programs.Text = 'Programs'
$btn_programs.FlatStyle = 'Flat'
$btn_programs.ForeColor = 'Black'
$form.Controls.Add($btn_programs)

# Label - Separator
$lbl_s1 = New-Object System.Windows.Forms.Label
$lbl_s1.Name = 's1'
$lbl_s1.Location = '770, 110'
$lbl_s1.Size = '150, 30'
$lbl_s1.Text = '___'
$lbl_s1.FlatStyle = 'Flat'
$lbl_s1.ForeColor = 'Black'
$lbl_s1.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$form.Controls.Add($lbl_s1)

# Button - NuGet
$btn_nuget = New-Object System.Windows.Forms.Button
$btn_nuget.Name = 'btn-nuget'
$btn_nuget.Location = '770, 140'
$btn_nuget.Size = '150, 30'
$btn_nuget.Text = 'NuGet'
$btn_nuget.FlatStyle = 'Flat'
$btn_nuget.ForeColor = 'Black'
$form.Controls.Add($btn_nuget)

# Button - Winget
$btn_wget = New-Object System.Windows.Forms.Button
$btn_wget.Name = 'btn-wget'
$btn_wget.Location = '770, 180'
$btn_wget.Size = '150, 30'
$btn_wget.Text = 'Winget'
$btn_wget.FlatStyle = 'Flat'
$btn_wget.ForeColor = 'Black'
$form.Controls.Add($btn_wget)

# Label - Separator
$lbl_s2 = New-Object System.Windows.Forms.Label
$lbl_s2.Name = 's2'
$lbl_s2.Location = '770, 200'
$lbl_s2.Size = '150, 30'
$lbl_s2.Text = '___'
$lbl_s2.FlatStyle = 'Flat'
$lbl_s2.ForeColor = 'Black'
$lbl_s2.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$form.Controls.Add($lbl_s2)

# Button - System
$btn_system = New-Object System.Windows.Forms.Button
$btn_system.Name = 'btn-system'
$btn_system.Location = '770, 230'
$btn_system.Size = '150, 30'
$btn_system.Text = 'System'
$btn_system.FlatStyle = 'Flat'
$btn_system.ForeColor = 'Black'
$form.Controls.Add($btn_system)

# Button - Accounts
$btn_accnt = New-Object System.Windows.Forms.Button
$btn_accnt.Name = 'btn-accounts'
$btn_accnt.Location = '770, 270'
$btn_accnt.Size = '150, 30'
$btn_accnt.Text = 'Accounts'
$btn_accnt.FlatStyle = 'Flat'
$btn_accnt.ForeColor = 'Black'
$form.Controls.Add($btn_accnt)

# Button - System Settings
$btn_sstg = New-Object System.Windows.Forms.Button
$btn_sstg.Name = 'btn-sstg'
$btn_sstg.Location = '770, 310'
$btn_sstg.Size = '150, 30'
$btn_sstg.Text = 'System Settings'
$btn_sstg.FlatStyle = 'Flat'
$btn_sstg.ForeColor = 'Black'
$form.Controls.Add($btn_sstg)

# Button - System Settings
$btn_dbloat = New-Object System.Windows.Forms.Button
$btn_dbloat.Name = 'btn-dblt'
$btn_dbloat.Location = '770, 350'
$btn_dbloat.Size = '150, 30'
$btn_dbloat.Text = 'Debloat'
$btn_dbloat.FlatStyle = 'Flat'
$btn_dbloat.ForeColor = 'Black'
$form.Controls.Add($btn_dbloat)

# Label - Separator
$lbl_s3 = New-Object System.Windows.Forms.Label
$lbl_s3.Name = 's2'
$lbl_s3.Location = '770, 370'
$lbl_s3.Size = '150, 30'
$lbl_s3.Text = '___'
$lbl_s3.FlatStyle = 'Flat'
$lbl_s3.ForeColor = 'Black'
$lbl_s3.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$form.Controls.Add($lbl_s3)

# Button - Organize files
$btn_ofiles = New-Object System.Windows.Forms.Button
$btn_ofiles.Name = 'btn-ofiles'
$btn_ofiles.Location = '770, 400'
$btn_ofiles.Size = '150, 30'
$btn_ofiles.Text = 'Organise Files'
$btn_ofiles.FlatStyle = 'Flat'
$btn_ofiles.ForeColor = 'Black'
$form.Controls.Add($btn_ofiles)

# Label - Separator
$lbl_s4 = New-Object System.Windows.Forms.Label
$lbl_s4.Name = 's2'
$lbl_s4.Location = '770, 440'
$lbl_s4.Size = '150, 30'
$lbl_s4.Text = '|'
$lbl_s4.FlatStyle = 'Flat'
$lbl_s4.ForeColor = 'Black'
$lbl_s4.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$form.Controls.Add($lbl_s4)

# Button - Settings
$btn_sttg = New-Object System.Windows.Forms.Button
$btn_sttg.Name = 'btn-sttg'
$btn_sttg.Location = '770, 480'
$btn_sttg.Size = '150, 30'
$btn_sttg.Text = 'Settings'
$btn_sttg.FlatStyle = 'Flat'
$btn_sttg.ForeColor = 'Black'
$form.Controls.Add($btn_sttg)

[void]$form.ShowDialog()