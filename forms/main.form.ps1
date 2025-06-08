$form = New-Form @{name="main-form"; size="1080, 660"; text="OSMN"; bcolor="#454446"; showico="$false"; fborstyle="None"}
$titlebar = New-Titlebar @{name="titlebar"; bcolor="#888B8D"; height="45"} $form

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
$titlelabel = New-Label @{name="titlelabel"; size="250, 30"; location="5,5"; text="OSMN";fcolor="White";bcolor="#888B8D"} $titlebar

# Titlebar - Button - Minimise
$titlebtnmin = New-Label @{name="titlebtnmin";text="⤓";size="40, 40";location="1000, 0";bcolor="#888B8D";fcolor="white";align="MC"} $titlebar
$titlebtnmin.Add_MouseEnter({
    $titlebtnmin.BackColor = "#242424"
})
$titlebtnmin.Add_MouseLeave({
    $titlebtnmin.BackColor = "#888B8D"
})
$titlebtnmin.Add_Click({
    $form.WindowState = [System.Windows.Forms.FormWindowState]::Minimized
})

# Titlebar - Button - Close
$titlebtnclose = New-Label @{name="titlebtnclose";text="⛌";size="40, 40";location="1040, 0";bcolor="#888B8D";fcolor="white";align="MC"} $titlebar
$titlebtnclose.Add_MouseEnter({
    $titlebtnclose.BackColor = "#7E0100"
})
$titlebtnclose.Add_MouseLeave({
    $titlebtnclose.BackColor = "#888B8D"
})
$titlebtnclose.Add_Click({
   [void]$form.Dispose()
})

# Form - Label - Computer Info
$btnCInfo = New-Label @{name="btnCInfo";text="Computer Info";size="180, 35";location="0,40";bcolor="#5b5a5c";fcolor="white";align="MC"} $form
$btnCInfo.Add_MouseEnter({
    $btnCInfo.BackColor = "#666667"
})
$btnCInfo.Add_MouseLeave({
    $btnCInfo.BackColor = "#5b5a5c"
})
$btnCInfo.Add_Click({
    
})

# Form - Label - User Session Control
$btnUControl = New-Label @{name="btnUControl";text="User Session";size="180, 35";location="0,75";bcolor="#5b5a5c";fcolor="white";align="MC"} $form
$btnUControl.Add_MouseEnter({
    $btnUControl.BackColor = "#666667"
})
$btnUControl.Add_MouseLeave({
    $btnUControl.BackColor = "#5b5a5c"
})
$btnUControl.Add_Click({

})

# Form - Label - Service
$btnService = New-Label @{name="btnService";text="Services";size="180, 35";location="0,110";bcolor="#5b5a5c";fcolor="white";align="MC"} $form
$btnService.Add_MouseEnter({
    $btnService.BackColor = "#666667"
})
$btnService.Add_MouseLeave({
    $btnService.BackColor = "#5b5a5c"
})
$btnService.Add_Click({

})

# Form - Label - System Info
$btnSInfo = New-Label @{name="btnSInfo";text="System Info";size="180, 35";location="0,145";bcolor="#5b5a5c";fcolor="white";align="MC"} $form
$btnSInfo.Add_MouseEnter({
    $btnSInfo.BackColor = "#666667"
})
$btnSInfo.Add_MouseLeave({
    $btnSInfo.BackColor = "#5b5a5c"
})
$btnSInfo.Add_Click({

})

# Form - Label - Task Scheduler
$btnTScheduler = New-Label @{name="btnTScheduler";text="Task Scheduler";size="180, 35";location="0,180";bcolor="#5b5a5c";fcolor="white";align="MC"} $form
$btnTScheduler.Add_MouseEnter({
    $btnTScheduler.BackColor = "#666667"
})
$btnTScheduler.Add_MouseLeave({
    $btnTScheduler.BackColor = "#5b5a5c"
})
$btnTScheduler.Add_Click({

})

# Form - Label - Network Tools
$btnNTools = New-Label @{name="btnNTools";text="Network Tools";size="180, 35";location="0,215";bcolor="#5b5a5c";fcolor="white";align="MC"} $form
$btnNTools.Add_MouseEnter({
    $btnNTools.BackColor = "#666667"
})
$btnNTools.Add_MouseLeave({
    $btnNTools.BackColor = "#5b5a5c"
})
$btnNTools.Add_Click({

})

# Form - Label - Application Manager
$btnATools = New-Label @{name="btnATools";text="Applications";size="180, 35";location="0,250";bcolor="#5b5a5c";fcolor="white";align="MC"} $form
$btnATools.Add_MouseEnter({
    $btnATools.BackColor = "#666667"
})
$btnATools.Add_MouseLeave({
    $btnATools.BackColor = "#5b5a5c"
})
$btnATools.Add_Click({

})

# Form - Label - Settings
$btnSettings = New-Label @{name="btnSettings";text="Settings";size="180, 35";location="0,625";bcolor="#5b5a5c";fcolor="white";align="MC"} $form
$btnSettings.Add_MouseEnter({
    $btnSettings.BackColor = "#666667"
})
$btnSettings.Add_MouseLeave({
    $btnSettings.BackColor = "#5b5a5c"
})
$btnSettings.Add_Click({

})

[void]$form.ShowDialog()