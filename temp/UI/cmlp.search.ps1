# Main Form
$form = New-Object System.Windows.Forms.Form
$form.Name = 'PGR-Form'
$form.Text = 'Search'
$form.Size = '300, 140'
$form.StartPosition = 'CenterScreen'
$form.ShowIcon = $false
$form.MaximizeBox = $false
$form.FormBorderStyle = 'FixedSingle'
$form.ForeColor = 'Control'
$form.BackColor = 'ControlDark'

# Label - Search
$lbl_search_text = New-Object System.Windows.Forms.Label
$lbl_search_text.Name = 'lbl-search-text'
$lbl_search_text.Text = 'Search'
$lbl_search_text.Size = '100, 25'
$lbl_search_text.Location = '10, 10'
$lbl_search_text.ForeColor = 'Black'
$form.Controls.Add($lbl_search_text)

# Textbox - Search
$tb_search_text = New-Object System.Windows.Forms.TextBox
$tb_search_text.Name = 'tb-search-text'
$tb_search_text.Size = '260, 40'
$tb_search_text.Location = '10, 35'
$tb_search_text.ForeColor = 'Black'
$tb_search_text.BorderStyle = 'FixedSingle'
$form.Controls.Add($tb_search_text)

# Button - search
$btn_search = New-Object System.Windows.Forms.Button
$btn_search.Name = 'btn-search'
$btn_search.Text = 'Search'
$btn_search.Size = '70, 25'
$btn_search.ForeColor = 'Black'
$btn_search.BackColor = 'LightGreen'
$btn_search.Location = '120, 65'
$btn_search.FlatStyle = 'Flat'
$btn_search.Add_Click({ 
    [void]$form.Close()
 })
$form.Controls.Add($btn_search)

# Button - Cancel
$btn_cancel = New-Object System.Windows.Forms.Button
$btn_cancel.Name = 'btn-cancel'
$btn_cancel.Text = 'Cancel'
$btn_cancel.Size = '70, 25'
$btn_cancel.ForeColor = 'Black'
$btn_cancel.BackColor = 'Salmon'
$btn_cancel.Location = '200, 65'
$btn_cancel.FlatStyle = 'Flat'
$btn_cancel.Add_Click({ [void]$form.Close() })
$form.Controls.Add($btn_cancel)

[void]$form.ShowDialog()
return $tb_search_text.Text