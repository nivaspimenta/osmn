Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# -- Create Form --
$form = New-Object System.Windows.Forms.Form
$form.Text = ""
$form.FormBorderStyle = 'None'    # Removes standard title bar
$form.StartPosition = 'CenterScreen'
$form.Size = New-Object System.Drawing.Size(800, 600)
$form.BackColor = [System.Drawing.Color]::White
$form.TopMost = $false

# -- Create Custom Title Bar Panel --
$titleBar = New-Object System.Windows.Forms.Panel
$titleBar.Height = 40
$titleBar.Dock = 'Top'
$titleBar.BackColor = [System.Drawing.Color]::MidnightBlue
$form.Controls.Add($titleBar)

# -- Add Title Label --
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "My Custom WinForms Title Bar"
$titleLabel.ForeColor = [System.Drawing.Color]::White
$titleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Regular)
$titleLabel.AutoSize = $true
$titleLabel.Location = New-Object System.Drawing.Point(12, 8)
$titleBar.Controls.Add($titleLabel)

# -- Minimize Button --
$btnMinimize = New-Object System.Windows.Forms.Button
$btnMinimize.Text = "━"
$btnMinimize.Width = 50
$btnMinimize.Height = 40
$btnMinimize.Dock = 'Right'
$btnMinimize.FlatStyle = 'Flat'
$btnMinimize.FlatAppearance.BorderSize = 0
$btnMinimize.BackColor = [System.Drawing.Color]::SteelBlue
$btnMinimize.ForeColor = [System.Drawing.Color]::White
$btnMinimize.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$btnMinimize.Add_Click({ $form.WindowState = 'Minimized' })
$titleBar.Controls.Add($btnMinimize)

# -- Close Button --
$btnClose = New-Object System.Windows.Forms.Button
$btnClose.Text = "✖"
$btnClose.Width = 50
$btnClose.Height = 40
$btnClose.Dock = 'Right'
$btnClose.FlatStyle = 'Flat'
$btnClose.FlatAppearance.BorderSize = 0
$btnClose.BackColor = [System.Drawing.Color]::Firebrick
$btnClose.ForeColor = [System.Drawing.Color]::White
$btnClose.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$btnClose.Add_Click({ $form.Close() })
$titleBar.Controls.Add($btnClose)

# -- Enable dragging the window by dragging the title bar --
$global:dragging = $false
$global:dragStart = $null

$titleBar.Add_MouseDown({
    if ($_.Button -eq 'Left') {
        $global:dragging = $true
        $global:dragStart = [System.Windows.Forms.Cursor]::Position
    }
})

$titleBar.Add_MouseMove({
    if ($global:dragging) {
        $pos = [System.Windows.Forms.Cursor]::Position
        $form.Left += ($pos.X - $global:dragStart.X)
        $form.Top += ($pos.Y - $global:dragStart.Y)
        $global:dragStart = $pos
    }
})

$titleBar.Add_MouseUp({
    $global:dragging = $false
})

# -- Show the Form --
[void]$form.ShowDialog()


$form = New-Form @{name="main-form"; size="950, 560"; text="OSMN"; bcolor="#8a8a8a"; showico="$false"; fborstyle="FixedSingle"}

$btn_services = New-Button @{name="btn-services"; location="0,0"; size="50, 50"; text="S"; bcolor="#8a8a8a"} $form
$btn_services.Add_MouseEnter({
    $btn_services.Size = '200, 50'
    $btn_services.Text = 'Services'
 })
$btn_services.Add_MouseLeave({
    $btn_services.Size = '50, 50'
    $btn_services.Text = 'S'
})

$btn_programs = New-Button @{name="btn-programs"; location="0, 50"; size="50,50"; text="P"; bcolor="#8a8a8a"} $form
$btn_programs.Add_MouseEnter({
    $btn_programs.Size = '200, 50'
    $btn_programs.Text = 'Programs'
 })
$btn_programs.Add_MouseLeave({
    $btn_programs.Size = '50, 50'
    $btn_programs.Text = 'P'
})

$btn_account = New-Button @{name="btn-account"; location="0, 100"; size="50,50"; text="A"; bcolor="#8a8a8a"} $form
$btn_account.Add_MouseEnter({
    $btn_account.Size = '200, 50'
    $btn_account.Text = 'Account'
 })
$btn_account.Add_MouseLeave({
    $btn_account.Size = '50, 50'
    $btn_account.Text = 'A'
})

$btn_settings = New-Button @{name="btn-settings"; location="0, 420"; size="50,50"; text="S"; bcolor="#8a8a8a"} $form
$btn_settings.Add_MouseEnter({
    $btn_settings.Size = '200, 50'
    $btn_settings.Text = 'Settings'
 })
$btn_settings.Add_MouseLeave({
    $btn_settings.Size = '50, 50'
    $btn_settings.Text = 'S'
})

$btn_exit = New-Button @{name="btn-exit"; location="0, 470"; size="50,50"; text="E"; bcolor="#8a8a8a"} $form
$btn_exit.Add_MouseEnter({
    $btn_exit.Size = '200, 50'
    $btn_exit.Text = 'Exit'
    $btn_exit.ForeColor = "#ff8c00"
 })
 $btn_exit.Add_MouseLeave({
    $btn_exit.Size = '50, 50'
    $btn_exit.Text = 'E'
    $btn_exit.Forecolor = "Black"
})

$btn_exit.Add_Click({
    if([Windows.Forms.MessageBox]::Show("Do you want to exit the application ?", "OSMN - Exit", "YesNo", "Question") -eq "Yes") {
        $form.Dispose()
    }
})

[void]$form.ShowDialog()

