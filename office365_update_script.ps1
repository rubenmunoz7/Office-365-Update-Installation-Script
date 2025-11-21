# NinjaOne Office365 Update Script
# Author: Ruben Munoz
# 10/16/2025
# This script will automate the download and installation of Microsoft Office 365
# It uses ODT (office deployment tool) and removes any existing Office installations and installs the latest  with specific settings e.g: update channel, language, latest installation, etc).  


# Parameter
[CmdletBinding()]
param( 
  [string]$CompanyName = "DefaultCompany"
)

# Variables
$Channel = "Current"                    # Office update channel: Current, monthly enterprise,  semiannual
$Language = "en-us"                     # Language for office365 installation
$ProductID = "O365ProPlusRetail"        # Product ID  for o365 apps for enterprise
$ExcludeTeamsClassic = $true            # exclude classic teams from installation
$OdtDownloadPage = "https://www.microsoft.com/en-us/download/details.aspx?id=49117" # reference page 

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$Root   = "C:\ProgramData\NinjaTemp\O365\$CompanyName" # Root directory
$OdtExe = Join-Path $Root "ODT.exe"       # Path for ODT
$Cfg    = Join-Path $Root "config.xml"    # Path to configuration XML file

New-Item -ItemType Directory -Path $Root -Force | Out-Null  # Create direcectory if it doesn't exist

# Download the latest ODT (office deployment tool)
Invoke-WebRequest -Uri "https://officecdn.microsoft.com/pr/wsus/setup.exe" -OutFile $OdtExe -UseBasicParsing
$Setup = $OdtExe
if (-not (Test-Path $Setup)) {
    throw "ODT setup.exe download failed"
}

$teamsLine = if ($ExcludeTeamsClassic) { '      <ExcludeApp ID="Teams" />' } else { "" }   # Exclude teams classic

# Office configuration XML content 
$config = @"
<Configuration>
  <Remove All="True" />
  <Add OfficeClientEdition="64" Channel="$Channel" AllowCdnFallback="TRUE">
    <Product ID="$ProductID">
$teamsLine
      <Language ID="$Language" />
      <Property Name="AUTOACTIVATE" Value="1" /> 
      <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
    </Product>
  </Add>
  <RemoveMSI All="True" />  

  <AppSettings>
    <Setup Name="Company" Value="$CompanyName" />
  </AppSettings>
  
  <Display Level="None" AcceptEULA="True" />
</Configuration>
"@

# Save config XML to file
Set-Content -Path $Cfg -Value $config -Encoding UTF8

# Launch Office setup with generated configuration
Start-Process -FilePath $Setup -ArgumentList "/configure `"$Cfg`"" -Wait
