<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://imgur.com/zneAXAu.png" alt="Project logo"></a>
</p>

<h3 align="center">Automate the download and installation of Microsoft Office 365</h3>

<div align="center">

</div>

---

<p align="center"> 
Uses ODT (office deployment tool) to removes any existing Office installations and installs the latest  with specific settings e.g: update channel, language, latest installation, etc).  
<br> 
</p>

## 📝 Table of Contents
- [About](#about)
- [Usage](#usage)
- [Built Using](#built_using)
- [Authors](#authors)
- [Acknowledgments](#acknowledgement)

---

## 📖 About <a name = "about"></a>
This powershell script was created for, but not limited to NinjaOne, to use for endpoints. It accepts a CompanyName parameter that is prompted when the script is about to be ran. It ises that parameter to create a sompany-specific folder under the directory C:\ProgramData\NinjaTemp\O365\**CompanyName**.
It then downloads the official Office Deployment Tool from Microsoft with: 
- A config.xml file with the following:
    - Microsoft 365 Apps for Enterprise
    - Update channel and language
    - Not include Teams (optional)
    - An AppSetting to include the Company tag using the value provided in parameter for CompanyName
It then runs setup.exe /configure config.xml to remove the old versions and install/update to the newer versions silently

**Parameters**
- CompanyName (string required), the logical name for the client which is used for the following:
    - Create a company specific ODT working folder
    - Tag the Office config with the CompanyName in parameters and the script will recognize it in the config
    - 


---

## 👨‍💻 Usage <a name="usage"></a>

To start the script:
1. Go to the target machine, Automation -> Script -> Office365 Update Script we then enter the Company Name we are updating the services for into the parameter box. 
2. Afte running the script, it will download ODT if it isn't already installed, generate the config.xml for that company, remove existing Office installations, and install/update 64-bit Microsoft 365 apps.
3. After the script is completed, you can verify the installation through C:\ProgramData\NinjaTemp\O365\**CompanyName** , the config.xml file will include the <AppSettings> company tag.
---

## ⛏️ Built Using <a name = "built_using"></a>
- [PowerShell](https://learn.microsoft.com/en-us/powershell/) – Automation scripting=
- [Microsoft](https://learn.microsoft.com/en-us/microsoft-365-apps/deploy/office-deployment-tool-configuration-options) - Microsoft 365 apps configuration

---

## ✍️ Authors <a name = "authors"></a>
- [@RubenMunoz](https://github.com/rubenmunoz7) – Developer & Maintainer  
---

## 🎉 Acknowledgements <a name = "acknowledgement"></a>
- Thanks to **Microsoft**  for providing configuration options documentation for Office Deployment Tool
