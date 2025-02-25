# Context Menu - Logs
$cml = New-Object System.Windows.Forms.ContextMenuStrip
$cml.Name = 'cms-log'

################################# Option Status ################################# 
$cml_status = New-Object System.Windows.Forms.ToolStripMenuItem
$cml_status.Name = 'cml-f-status'
$cml_status.Text = 'Status'

#Option - Filter -> Status -> Running
$cml_f_run = New-Object System.Windows.Forms.ToolStripMenuItem
$cml_f_run.Name = 'cml-f-stop'
$cml_f_run.Text = 'Running'
$cml_f_run.Add_Click({ 

        $dgv.Rows.Clear()

        $res = Get-Service | Where-Object { $_.Status -eq 'Running' }

        foreach ($r in $res) {
            $dgv.Rows.Add($r.Status, $r.Name, $r.DisplayName)
        }
        Clear-Host
    })

# Option - Filter -> Status -> Stop
$cml_f_stop = New-Object System.Windows.Forms.ToolStripMenuItem
$cml_f_stop.Name = 'cml-f-stop'
$cml_f_stop.Text = 'Stop'
$cml_f_stop.Add_Click({ $dgv.Rows.Clear()

        $res = Get-Service | Where-Object { $_.Status -eq 'Stopped' }

        foreach ($r in $res) {
            $dgv.Rows.Add($r.Status, $r.Name, $r.DisplayName)
        }
        Clear-Host
    })



# Add Item to Option Filter
$cml_status.DropDownItems.Add($cml_f_run)
$cml_status.DropDownItems.Add($cml_f_stop)
#################################################################################

################################# Option Search #################################
$cml_search = New-Object System.Windows.Forms.ToolStripMenuItem
$cml_search.Name = 'cml-search'
$cml_search.Text = 'Search'
$cml_search.Add_Click({
        $val = . .\ui\cmlp.search.ps1
        if ([String]::IsNullOrEmpty($val)) { return }

        $res = Get-Service | Where-Object { $_.DisplayName -like $val -or $_.Name -like $val }
   
        if ($res -ne $null) { 
            $dgv.Rows.Clear() 
            foreach ($r in $res) {
                $dgv.Rows.Add($r.Status, $r.Name, $r.DisplayName)
            }
        }
        else {
            . .\UI\msgbox.ui.ps1 -title "No results" -message "Nothing was found with the value: $val"
        }

    })

#################################################################################

################################# Option Import #################################
$cml_import = New-Object System.Windows.Forms.ToolStripMenuItem
$cml_import.Name = 'cml-import'
$cml_import.Text = 'Import'
$cml_import.Add_Click({  })
#################################################################################

################################# Option Export #################################
$cml_export = New-Object System.Windows.Forms.ToolStripMenuItem
$cml_export.Name = 'cml-export'
$cml_export.Text = 'Export'
$cml_export.Add_Click({  })
#################################################################################

################################# Option Reset ##################################
$cml_reset = New-Object System.Windows.Forms.ToolStripMenuItem
$cml_reset.Name = 'cml-reset'
$cml_reset.Text = 'Reset'
$cml_reset.Add_Click({ Show-Services })
#################################################################################

# Add to ContextMenuStrip
$cml.Items.Add($cml_search)
$cml.Items.Add($cml_status)
$cml.Items.Add("-")
$cml.Items.Add($cml_import)
$cml.Items.Add($cml_export)
$cml.Items.Add("-")
$cml.Items.Add($cml_reset)

