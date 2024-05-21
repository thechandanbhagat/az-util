function SBToken {
	param(
		[Alias("u")][string]$uri,
        [Alias("p")][string]$policy,
        [Alias("k")][string]$key,
        [Alias("t")][int]$time = 300
)

[Reflection.Assembly]::LoadWithPartialName("System.Web")| out-null
if (-not $uri ) {
    $uri=Read-Host "Service Bus URI"
}
if (-not $policy ) {
    $policy=Read-Host "Service Bus policy"
}
if (-not $key ) {
    $key=Read-Host "Service Bus key"
}

$Expires=([DateTimeOffset]::Now.ToUnixTimeSeconds())+$time
$SignatureString=[System.Web.HttpUtility]::UrlEncode($uri)+ "`n" + [string]$Expires
$HMAC = New-Object System.Security.Cryptography.HMACSHA256
$HMAC.key = [Text.Encoding]::ASCII.GetBytes($key)
$Signature = $HMAC.ComputeHash([Text.Encoding]::ASCII.GetBytes($SignatureString))
$Signature = [Convert]::ToBase64String($Signature)
$SASToken = "SharedAccessSignature sr=" + [System.Web.HttpUtility]::UrlEncode($uri) + "&sig=" + [System.Web.HttpUtility]::UrlEncode($Signature) + "&se=" + $Expires + "&skn=" + $policy

Write-Host "----- Token Copied to Clipboard -------"
# Copy the SAS token to the clipboard
$SASToken | Set-Clipboard
return $SASToken
}

Export-ModuleMember -Function SBToken