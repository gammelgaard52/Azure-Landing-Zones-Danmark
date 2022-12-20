#Get-PSRepository
Install-Module Microsoft.Graph -Scope CurrentUser -Repository PSGallery
Import-Module Microsoft.Graph
Import-Module Microsoft.Graph.Users
Connect-MgGraph -TenantId '97e7fa82-8ca6-4a93-a6c8-96ae01b69d29' -Scopes 'User.Read.All'
Get-MgUser -ConsistencyLevel eventual -Count userCount -Search '"DisplayName:Martin"'