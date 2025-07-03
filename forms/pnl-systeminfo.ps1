[CmdletBinding()]
param($panel)

# Computername
$lbl_cname = New-Label @{name="lbl_cname"; size="150, 30";location="10,5";text="Computer Name";fcolor="White";bcolor="#888B8D"} $panel
$txt_cname = New-TextBox @{name="txt_cname";asize=$false;size="250, 25";location="177,5";pht="Computer Name";fcolor="White";bcolor="#888B8D"; bstyle="FixedSingle"} $panel
