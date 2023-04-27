Install-Module ExchangeOnlineManagement 
Import-Module ExchangeOnlineManagement
Connect-IPPSSession
get-labelpolicy
Get-labelpolicy | select-object Name,DistributionStatus,Mode,WhenCreated,WhenChanged | FL
get-labelpolicy -identity "AllUsers" | fl DistributionStatus,DistributionResults,LastStatusUpdateTime #Targeting a specific identity give different output from not specifing an identity
get-labelpolicy -identity "AllUsers" | select-object Name,DistributionStatus,Mode,WhenCreated,WhenChanged | FL

get-labelpolicy -identity "EmailAllUsers"
get-labelpolicy -identity "FilesAllUsers"


# Working with auto-labeling
Get-AdminAuditLogConfig | Format-List UnifiedAuditLogIngestionEnabled
Connect-ExchangeOnline
Enable-OrganizationCustomization
Set-AdminAuditLogConfig -UnifiedAuditLogIngestionEnabled $true
Get-OrganizationConfig