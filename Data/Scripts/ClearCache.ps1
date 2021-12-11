taskkill /F /IM "chrome.exe"
Start-Sleep -Seconds 5
$Items = @('Cookies')
$ErrorActionPreference = 'SilentlyContinue'
$Folders = Get-ChildItem "$($env:LOCALAPPDATA)\Google\Chrome\User Data" | ?{ $_PSIsContainer -and $_.Name -eq "Default" -or $_.Name -like "Profile"}
$Folders | ForEach-Object {
	$tmp = $_
	$Items | ForEach-Object {
		if ((Test-Path -Path "$tmp\$_" )) {
			Remove-Item "$tmp\$_"
		}
	}
}