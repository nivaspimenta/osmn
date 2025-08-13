# Load Window
$window = Build-Window ".\ui\mf_ui.xaml"

### Controls

## Button - Title bar
$app_tltbr = $window.FindName("tlbr")
$btn_clbtn = $window.FindName("tlbr_btn_cls")
$btn_mnbtn = $window.FindName("tlbr_btn_min")

## Navigation Menu
$btn_cinfo = $window.FindName("btn_cinfo")
$btn_ainfo = $window.FindName("btn_ainfo")
$btn_prsvc = $window.FindName("btn_prsvc")
$btn_tsche = $window.FindName("btn_tsche")
$btn_netto = $window.FindName("btn_netto")
$btn_appma = $window.FindName("btn_appma")
$btn_sttgs = $window.FindName("btn_sttgs")

## Tabcontrol
$tab_forms = $window.FindName("tab_window")

## Button Save - ComputerInfo
$btn_cisv = $window.FindName("btn_cisv")

# Styles
$stl_navbtn = $window.Resources["NavButton"]
$stl_minbtn = $window.Resources["MinButton"]
$stl_clsbtn = $window.Resources["CloButton"]
$stl_sttngs = $window.Resources["SetButton"]

# Apply Styles
## Titlebar buttons
$btn_clbtn.Style = $stl_clsbtn
$btn_mnbtn.Style = $stl_minbtn

## Navigation Menu Button
$btn_cinfo.Style = $stl_navbtn
$btn_ainfo.Style = $stl_navbtn
$btn_prsvc.Style = $stl_navbtn
$btn_tsche.Style = $stl_navbtn
$btn_netto.Style = $stl_navbtn
$btn_appma.Style = $stl_navbtn
$btn_sttgs.Style = $stl_sttngs

## Button Save - ComputerInfo
$btn_cisv.Style = $stl_navbtn

# Functions, Methods & others

function CInfoLoad {
    param ()

    # Check if is on the right tab
    if($tab_forms.SelectedIndex -ne 0) { return }

    # Load the computer information
    $CINFO = Get-ComputerInfo | Select-Object -Property CsDNSHostName, CsManufacturer, CsModel, `
    CsProcessors, CsTotalPhysicalMemory, BiosSerialNumber, OsName, OsBuildNumber, OsInstallDate, OsSerialNumber, `
    OsLanguage, OsArchitecture, TimeZone, PowerPlatformRole, OsRegisteredUser, CsWorkgroup

    # Assign the values to each textbox
    $window.FindName("txt_cnam").Text = $CINFO.CsDNSHostName
    $window.FindName("txt_manu").Text = $CINFO.CsManufacturer
    $window.FindName("txt_npro").Text = $CINFO.CsProcessors

    
}

# Navigate menu
$MoveToMenu = {
    [CmdletBinding()]
    param($sender)

    switch ($sender.Name) {
        "btn_cinfo" { 
            $tab_forms.SelectedIndex = 0 
            CInfoLoad
        }
        "btn_ainfo" { $tab_forms.SelectedIndex = 1 }
        "btn_prsvc" { $tab_forms.SelectedIndex = 2 }
        "btn_tsche" { $tab_forms.SelectedIndex = 3 }
        "btn_netto" { $tab_forms.SelectedIndex = 4 }
        "btn_appma" { $tab_forms.SelectedIndex = 5 }
        "btn_sttgs" { $tab_forms.SelectedIndex = 6 }
    }

}

### Buttons
# Titlebar
$app_tltbr.Add_MouseLeftButtonDown({
    $window.DragMove()
})

$btn_mnbtn.Add_Click({
    $window.WindowState = 'Minimized'
})

$btn_clbtn.Add_Click({
    [void]$window.Close()
})

# Navigation Menu
$btn_cinfo.Add_Click($MoveToMenu)
$btn_ainfo.Add_Click($MoveToMenu)
$btn_prsvc.Add_Click($MoveToMenu)
$btn_tsche.Add_Click($MoveToMenu)
$btn_netto.Add_Click($MoveToMenu)
$btn_appma.Add_Click($MoveToMenu)
$btn_sttgs.Add_Click($MoveToMenu)

# Show the window
[void]$window.ShowDialog()