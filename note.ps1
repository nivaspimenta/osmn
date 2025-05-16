# ✖
# ━
    # Initialize global variables to track dragging state
$global:dragging = $false           # Indicates whether dragging is in progress
$global:dragStart = $null           # Stores the initial mouse position when dragging starts

# Handle the MouseDown event on the custom title bar area
$titleBar.Add_MouseDown({
    if ($_.Button -eq 'Left') {     # Check if the left mouse button is pressed
        $global:dragging = $true    # Enable dragging mode
        # Capture the current mouse position (screen coordinates)
        $global:dragStart = [System.Windows.Forms.Cursor]::Position
    }
})

# Handle the MouseMove event on the custom title bar area
$titleBar.Add_MouseMove({
    if ($global:dragging) {         # Proceed only if dragging mode is active
        # Get the current mouse position
        $pos = [System.Windows.Forms.Cursor]::Position

        # Calculate the difference (delta) between the new and old positions
        $deltaX = $pos.X - $global:dragStart.X
        $deltaY = $pos.Y - $global:dragStart.Y

        # Move the form by updating its position based on the mouse movement
        $form.Left += $deltaX
        $form.Top  += $deltaY

        # Update the starting point for the next mouse movement
        $global:dragStart = $pos
    }
})

# Handle the MouseUp event to stop dragging
$titleBar.Add_MouseUp({
    $global:dragging = $false       # Disable dragging mode when mouse is released
})
