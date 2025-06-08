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
        try {
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
        catch {
            Write-Host "Error in New-Form $($_.Exception.Message)"
        }
    }
    
    end {
        return $form
    }
}

function New-Label {
    [CmdletBinding()]
    param([hashtable]$param, $parent)

    begin {

    }

    process {
        try {
            $label = New-object System.Windows.Forms.Label
            $label.Name = if ($param.name) { $param.name } else { 'label' }
            $label.Location = if ($param.location) { $param.location } else { '10,10' }
            $label.Size = if ($param.size) { $param.size } else { '10, 10' }
            $label.Text = if ($param.text) { $param.text } else { 'label' }
            $label.FlatStyle = if ($param.fstyle) { $param.fstyle } else { 'Flat' }
            $label.Forecolor = if ($param.fcolor) { $param.fcolor } else { 'Black' }
            $label.BackColor = if ($param.bcolor) { $param.bcolor } else { "Black" }
            $label.TextAlign = if ($param.align) { Set-TextAlign -v $param.align } else { [System.Drawing.ContentAlignment]::MiddleLeft }
            $parent.Controls.Add($label)
        }
        catch {
            Write-Host "Error in New-Label $($_.Exception.Message)"
        }
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
        try {
            $button = New-Object System.Windows.Forms.Button
            $button.Name = if ($param.name) { $param.name } else { 'button' }
            $button.Location = if ($param.location) { $param.location } else { '10, 10' }
            $button.Size = if ($param.size) { $param.size } else { '150, 10' }
            $button.Text = if ($param.text) { $param.text } else { 'button' }
            $button.FlatStyle = if ($param.fstyle) { $param.fstyle } else { 'Flt' }
            $button.ForeColor = if ($param.fcolor) { $param.fcolor } else { 'Black' }
            $button.BackColor = if ($param.bcolor) { $param.bcolor } else { 'White' }
            $form.Controls.Add($button)
        }
        catch {
            Write-Host "Error in New-Button: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
    
    end {
        return $button
    }
}

function New-GridView {

    [CmdletBinding()]
    param([hashtable]$param, $parent, $cm)

    begin {

    }

    process {
        try {
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
        }
        catch {
            Write-Host "Error in New-GridView: $($_.Exception.Message)" -ForegroundColor Red
        }
    }

    end {
        return $grid 
    }
}

function Format-GridView {
    [CmdletBinding()]
    param( $cname, [string[]]$CollumnName, [int[]]$CollumnWidth )
    begin {

    }
    process {
        try {
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
        catch {
            Write-Host "Error in Format-GridView $($_.Exception.Message)"
        }
    }

    end {

    }
}

function New-Titlebar {
    [CmdletBinding()]
    param([hashtable]$param, $form)

    begin {
        <#

# -- Enable dragging the window by dragging the title bar --
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

#>
    }

    process {
        try {
            $panel = New-Object System.Windows.Forms.panel
            $panel.Name = if ($param.name) { $param.name } else { "titlebar" }
            $panel.Height = if ($param.heigh) { $param.height } else { '40' }
            $panel.Dock = if ($param.dock) { $param.dock } else { 'Top' }
            $panel.BackColor = if ($param.bcolor) { $param.bcolor } else { 'MidnightBlue' }
            $form.Controls.Add($panel)
        }
        catch {
            Write-Host "Error in New-Titlebar $($_)" -ForegroundColor Red
        }
    }

    end {
        return $panel
    }

}

function New-Panel {
    [CmdletBinding()]
    param([hashtable]$param, $form)

    begin {

    }

    process {
        try {
            $panel = New-Object System.Windows.Forms.Panel
            $panel.Name = if ($param.name) { $param.name } else { "panel" }
            $panel.Size = if ($param.size) { $param.size } else { "200, 200" }
            $panel.Location = if ($param.location) { $param.location } else { "10, 10" }
            $panel.BackColor = if ($param.bcolor) { $param.bcolor } else { "white" }
            $panel.BorderStyle = if ($param.bstyle) { $param.bstyle } else { "FixedSingle" }
            $form.Controls.Add($panel)
        }
        catch {
            Write-Host "Error in New-Panel $($_.Message.Exception)"
        }
    }

    end {
        return $panel
    }
}
