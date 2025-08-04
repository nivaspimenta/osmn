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

# Functions & Methods

function Join-ComputerInfo {
    [CmdletBinding()]
    param()

    begin {
        
    }

    process {

    }

    end {

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
$btn_cinfo.Add_Click({
    $tab_forms.SelectedIndex = 0
})

$btn_ainfo.Add_Click({
    $tab_forms.SelectedIndex = 1
})


# Show the window
[void]$window.ShowDialog()