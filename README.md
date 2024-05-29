# Powershell Module 
---
## Install 
`Install-Module -Name UtilModule`
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
