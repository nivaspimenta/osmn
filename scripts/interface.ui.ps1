Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function Set-TextAlign {
    param( [string] $v )

    switch ($v) {
        "TL" { return [System.Drawing.ContentAlignment]::TopLeft }
        "TC" { return [System.Drawing.ContentAlignment]::TopCenter }
        "TR" { return [System.Drawing.ContentAlignment]::TopRight }
        "ML" { return [System.Drawing.ContentAlignment]::MiddleLeft }
        "MC" { return [System.Drawing.ContentAlignment]::MiddleCenter }
        "MR" { return [System.Drawing.ContentAlignment]::MiddleRight }
        "BL" { return [System.Drawing.ContentAlignment]::BottomLeft }
        "BC" { return [System.Drawing.ContentAlignment]::BottomCenter }
        "BR" { return [System.Drawing.ContentAlignment]::BottomRight }
        Default {
            return [System.Drawing.ContentAlignment]::MiddleLeft
        }
    }

}

function New-Form {
    [CmdletBinding()]
    param (
        [hashtable] $param = @{}, $parent)

    begin {

    }

    process {
        $form = New-Object System.Windows.Forms.Form
        $form.Name = if ($param.name) { $param.name } else { 'form' }
        $form.Text = if ($param.text) { $param.text } else { 'Form' }
        $form.Size = if ($param.size) { $param.size } else { '600, 400' }
        $form.StartPosition = if ($param.startpos) { $param.startpos } else { 'CenterScreen' }
        $form.ShowIcon = if ($param.showico) { [bool]::Parse($param.showico) } else { $true }
        $form.MaximizeBox = if ($param.maxbox) { [bool]::Parse($param.maxbox) } else { $true }
        $form.FormBorderStyle = if ($param.fborstyle) { $param.fborstyle } else { 'Sizable' }
        $form.ForeColor = if ($param.fcolor) { $param.fcolor } else { 'Black' }
        $form.BackColor = if ($param.bcolor) { $param.bcolor } else { 'White' }
    }
    
    end {
        return $form
    }
}

function New-Label {
    [CmdletBinding()]
    param([hashtable]$param, $form )

    begin {

    }

    process {
        $label = New-object System.Windows.Forms.Label
        $label.Name = if ($param.name) { $param.name } else { 'label' }
        $label.Location = if ($param.location) { $param.location } else { '10,10' }
        $label.Size = if ($param.size) { $param.size } else { '10, 10' }
        $label.Text = if ($param.text) { $param.text } else { 'label' }
        $label.FlatStyle = if ($param.fstyle) { $param.fstyle } else { 'Flat' }
        $label.Forecolor = if ($param.fcolor) { $param.fcolor } else { 'Black' }
        $label.TextAlign = if ($param.align) { Set-TextAlign -v $param.align } else { [System.Drawing.ContentAlignment]::MiddleLeft }
        $parent.Controls.Add($label)
    }

    end {
        return $label
    }
}

function New-Button {
    [CmdLetBinding()]
    param( [hashtable] $param, $form )

    begin {

    }

    process {
        $button = New-Object System.Windows.Forms.Button
        $button.Name = if ($param.name) { $param.name } else { 'button' }
        $button.Location = if ($param.location) { $param.location } else { '10, 10' }
        $button.Size = if ($param.size) { $param.size } else { '150, 10' }
        $button.Text = if ($param.text) { $param.text } else { 'button' }
        $button.FlatStyle = if ($param.fstyle) { $param.fstyle } else { 'Flat' }
        $button.ForeColor = if ($param.fcolor) { $param.fcolor } else { 'Black' }
        $button.BackColor = if ($param.bcolor) { $param.bcolor } else { 'White' }
        $form.Controls.Add($button)
    }
    
    end {
        return $button
    }
}

function New-GridView {

    [CmdletBinding()]
    param([hashtable]$param, $parent, $cm)

    $grid = New-Object System.Windows.Forms.DataGridView
    $grid.Name = if ($param.name) { $param.name } else { 'DataGridView' }
    $grid.Location = if ($param.location) { $param.location } else { '0, 0' }
    $grid.Size = if ($param.size) { $param.size } else { '40, 30' }
    $grid.AllowUserToAddRows = if ($param.autar) { [bool]::Parse($param.autar) } else { $false }
    $grid.RowHeadersVisible = if ($param.rhv) { [bool]::Parse($param.rhv) } else { $false }
    $grid.ForeColor = if ($param.fc) { $param.fc } else { 'Black' }
    $grid.RowHeadersBorderStyle = if ($param.rhbs) { $param.rhbs } else { 'Single' }
    $grid.AllowUserToResizeRows = if ($param.autrr) { [bool]::Parse($param.autrr) } else { $false }
    $grid.AllowUserToResizeColumns = if ($param.autrc) { [bool]::Parse($param.autrc) } else { $false }
    $grid.AllowUserToDeleteRows = if ($param.autdr) { [bool]::Parse($param.autdr) } else { $false }
    $grid.AllowUserToOrderColumns = if ($param.autoc) { [bool]::Parse($param.autoc) } else { $false }
    $grid.ContextMenuStrip = if ($cm) { $cm } else { $null }
    $grid.ColumnHeadersBorderStyle = if ($param.chbs) { $param.chbs } else { 'Single' }
    $grid.SelectionMode = if ($param.sm) { $param.sm } else { 'FullRowSelect' }
    $grid.RowHeadersWidthSizeMode = if ($param.rhwsm) { $param.rhwsm } else { 'DisableResizing' }
    $grid.ScrollBars = if ($param.sb) { $param.sb } else { 'Vertical' }
    $grid.ReadOnly = if ($param.ro) { $param.ro } else { $true }
    $parent.Controls.Add($grid)

    return $grid

}

function Format-GridView {
    [CmdletBinding()]
    param( $cname, [string[]]$CollumnName, [int[]]$CollumnWidth )
    
    # Change the number of collumns
    $cname.ColumnCount = $CollumnName.Count

    # Clear all the rows
    $cname.Rows.Clear()

    # Add the collumn names
    for ($i = 0; ($i -le ($CollumnName.Count - 1)); $i++) {
        $cname.Columns[$i].Name = $CollumnName[$i]
        $cname.Columns[$i].Width = $CollumnWidth[$i]
    }

}
