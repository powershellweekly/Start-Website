<#
.Synopsis
   Start-Website with a browser selection option. 
.DESCRIPTION
   Start-Website function is used to select which web browser you want to open a website with. 
.EXAMPLE
   Start-Website -Site PowerShellWeekly.com -Browser Edge

.EXAMPLE
   Start-Website PowerShellWeekly.com Edge
   
.EXAMPLE
   Start-Website -Site ThomasITServices.com -Browser Chrome

.EXAMPLE
  Start-Website -Site https://www.affauto.com -Browser IE

#>
function Start-Website
{
[CmdletBinding()]
param (
[String]$Site,
[ValidateSet('Chrome','Edge','IE')] $Browser
)

Switch ($Browser)
	{
		"Chrome"{ Start-Process "chrome.exe" $Site; Break; }
		"Edge"{ Start-Process microsoft-edge:$Site; Break; }
		"IE"{ $ie = New-Object -ComObject InternetExplorer.Application; $ie.Navigate($Site); $ie.Visible = $true; Break; }
	}
	
}