# Functional functions ------------------------------------------------------------
function Format-GridView {
    [CmdletBinding()]
    param(
        [string[]]$CollumnName,
        [int[]]$CollumnWidth
    )
    
    # Change the number of collumns
    $dgv.ColumnCount =  $CollumnName.Count

    $dgv.Rows.Clear()

    # Add the collumn names
    for($i = 0; ($i -le ($CollumnName.Count - 1)); $i++) {
        $dgv.Columns[$i].Name = $CollumnName[$i]
        $dgv.Columns[$i].Width = $CollumnWidth[$i]
    }

}

# Buttons funtions -----------------------------------------------------------------
function Show-Services {

    # Format DGV - Add Collumns
    Format-GridView @('Status', 'Name', 'Description') @('100', '350', '275')

    # Change the alternative colors of a grid
    $dgv.AlternatingRowsDefaultCellStyle.BackColor = 'LightCyan'

    # Call the context Menu
    . .\UI\cml.cms.ps1

    # Context Menu Strip
    $dgv.ContextMenuStrip = $cml
    
    # Get Services
    $services = Get-Service

    foreach($s in $services) {
        $dgv.Rows.Add($s.Status, $s.Name, $s.DisplayName)
    }

    Clear-Host

}