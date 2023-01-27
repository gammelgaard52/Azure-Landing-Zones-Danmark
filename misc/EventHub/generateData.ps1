[Reflection.Assembly]::LoadWithPartialName("System.Web")| out-null
$URI="hub-management-compliance.servicebus.windows.net/hub-sub-canary-sandbox"
$Access_Policy_Name="powershell"
$Access_Policy_Key="dPBqUswF7YGjYz3MeQcaZq7ZAivFS8aDNqhd5lC1KUc="
#Token expires now+3000
$Expires=([DateTimeOffset]::Now.ToUnixTimeSeconds())+3000
$SignatureString=[System.Web.HttpUtility]::UrlEncode($URI)+ "`n" + [string]$Expires
$HMAC = New-Object System.Security.Cryptography.HMACSHA256
$HMAC.key = [Text.Encoding]::ASCII.GetBytes($Access_Policy_Key)
$Signature = $HMAC.ComputeHash([Text.Encoding]::ASCII.GetBytes($SignatureString))
$Signature = [Convert]::ToBase64String($Signature)
$SASToken = "SharedAccessSignature sr=" + [System.Web.HttpUtility]::UrlEncode($URI) + "&sig=" + [System.Web.HttpUtility]::UrlEncode($Signature) + "&se=" + $Expires + "&skn=" + $Access_Policy_Name
$SASToken



$method = "POST"
$URI = "https://hub-management-compliance.servicebus.windows.net/hub-sub-canary-sandbox/messages"
$signature = "$SASToken"

# API headers
$headers = @{
            "Authorization"=$signature;
            "Content-Type"="application/atom+xml;type=entry;charset=utf-8";
            }


# create Request Body
$body = "{'DeviceId':'dev-01', 'Temperature':'37.0'}"

# execute the Azure REST API
Invoke-RestMethod -Uri $URI -Method $method -Headers $headers -Body $body