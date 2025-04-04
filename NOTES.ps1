# FILE TO NOTE CODE

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