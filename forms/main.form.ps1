$form = New-Form @{name="main-form"; size="1080, 660"; text="OSMN"; bcolor="#8a8a8a"; showico="$false"; fborstyle="None"}
$titlebar = New-Titlebar @{name="titlebar"; bcolor="#ff7b33"; height="45"} $form

$global:dragging = $false
$global:dragStart = $null

$titlebar.Add_MouseDown({
    if ($_.Button -eq 'Left') {
        $global:dragging = $true
        $global:dragStart = [System.Windows.Forms.Cursor]::Position
    }
})

$titlebar.Add_MouseMove({
    if ($global:dragging) {
        $pos = [System.Windows.Forms.Cursor]::Position
        $form.Left += ($pos.X - $global:dragStart.X)
        $form.Top += ($pos.Y - $global:dragStart.Y)
        $global:dragStart = $pos
    }
})

$titlebar.Add_MouseUp({
    $global:dragging = $false
})

# Titlebar - Label - OSMN
$titlelabel = New-Label @{name="title-label"; size="150, 30"; location="5,5"; text="OSMN"; fcolor="Black"} $titlebar

# Titlebar - Button - Minimise
$titlebtnmin = New-Label @{name="titlebtnmin";text="─";size="35, 35";location="1005, 2";bcolor="#ff7b33";align="MC"} $titlebar
$titlebtnmin.Add_MouseEnter({
    $titlebtnmin.BackColor = "#8a8a8a"
})
$titlebtnmin.Add_MouseLeave({
    $titlebtnmin.BackColor = "#ff7b33"
})
$titlebtnmin.Add_Click({
    $form.WindowState = [System.Windows.Forms.FormWindowState]::Minimized
})

# Titlebar - Button - Close
$titlebtnclose = New-Label @{name="titlebtnclose";text="х";size="35, 35";location="1042, 2";bcolor="#ff7b33";align="MC"} $titlebar
$titlebtnclose.Add_MouseEnter({
    $titlebtnclose.BackColor = "#ff0000"
})
$titlebtnclose.Add_MouseLeave({
    $titlebtnclose.BackColor = "#ff7b33"
})
$titlebtnclose.Add_Click({
   [void]$form.Dispose()
})



[void]$form.ShowDialog()