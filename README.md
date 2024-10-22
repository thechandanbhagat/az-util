# Powershell Module 
![PowerShell Gallery Downloads](https://img.shields.io/powershellgallery/dt/utilmodule?style=for-the-badge&logo=nuget) ![PowerShell Gallery Version](https://img.shields.io/powershellgallery/v/utilmodule?style=for-the-badge&logo=nuget&label=Powershell%20Version)
---
## Install 
```powershell
Install-Module -Name UtilModule
```
---
## Usage
### az-sbtoken
```powershell
# First Method
az-sbtoken <URL> <policy-name> <key> <time (optional)>

# Second Method
az-sbtoken -uri <url> -policy <policy> -key <key> -time <time>

# third method
az-sbtoken -u <url> -p <policy> -k <key> -t <time>

#forth method
>> az-sbtoken
# you will be prompted to enter the necessary parameters
```
### util-decode-jwt

---
## Get list of Commands 
```powershell
Get-Command -Module UtilModule -CommandType Function
```
