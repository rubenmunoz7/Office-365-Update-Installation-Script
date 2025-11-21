<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://imgur.com/qACS8rr.png" alt="Project logo"></a>
</p>

<h3 align="center">Automate the download and installation of Microsoft Office 365</h3>

<div align="center">

</div>

---

<p align="center"> 
Uses ODT (office deployment tool) and removes any existing Office installations and installs the latest  with specific settings e.g: update channel, language, latest installation, etc).  
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
This script takes a Company Name parameter, uses it to create a company specific folder. It then downloads the Office Deployment Tool (ODT) from Microsoft, 
and generates a config.xml file with the language, product, and an Appsettings company tag for the Company Name. 

---

## 👨‍💻 Usage <a name="usage"></a>

To start the script:
1. Go to the target machine, Automation -> Script -> Office365 Update Script we then enter the Company Name we are updating the services for into the parameter box. 
2. The script will then automate the process via Office Deployment Tool (ODT), and install/update all of the necessary O365 softwares, along with creating a Company tag using the company name. 
3. The script will show a successful output along with the list of programs that have been updated/installed on the target machine. 
---

## ⛏️ Built Using <a name = "built_using"></a>
- [PowerShell](https://learn.microsoft.com/en-us/powershell/) – Automation scripting
- [Windows](https://learn.microsoft.com/en-us/microsoft-365-apps/deploy/office-deployment-tool-configuration-options) - ODT configuration options

---

## ✍️ Authors <a name = "authors"></a>
- [@RubenMunoz](https://github.com/rubenmunoz7) – Developer & Maintainer  
---

## 🎉 Acknowledgements <a name = "acknowledgement"></a>
- Thanks to **Microsoft**  for providing configuration options for Office Deployment Tool
