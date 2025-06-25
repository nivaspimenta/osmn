[CmdletBinding()]
param($panel)
$lbl_username = New-Label @{name="lbl-username"; size="150, 30"; location="10,5"; text="User Name";fcolor="White";bcolor="#888B8D"} $panel