
$form = New-Form @{name="main-form"; size="950, 560"; text="OSMN"; bcolor="#8a8a8a"; showico=$false; fborstyle="FixedSingle"}

$btn_service = New-Button @{name="btn-service"; location="0,0"; size="50, 50"; text="S"; bcolor="#8a8a8a"} $form
$btn_service.Add_MouseEnter({
    $btn_service.Size = '200, 50'
    $btn_service.Text = 'Service'
 })
$btn_service.Add_MouseLeave({
    $btn_service.Size = '50, 50'
    $btn_service.Text = 'S'
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

[void]$form.ShowDialog()