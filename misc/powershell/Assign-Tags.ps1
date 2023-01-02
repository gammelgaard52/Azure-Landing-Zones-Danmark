param (
    [Parameter(Mandatory = $true)]
    [String]
    $Prefix,
    [Parameter(Mandatory = $true)]
    [String]
    $TagOwner
)

#create an empty array to hold subscriptions
$subscriptions = @()
# Iterate Management Groups to get subscriptions
ForEach ($mgmtGrp in Get-AzManagementGroup){

    #Filter Management Groups on Prefix
    If($mgmtGrp.Name -match $Prefix){

        # query Azure Graph for subscriptions in the management group and add them to the array of subscriptions
        $query = "ResourceContainers | where type =~ 'microsoft.resources/subscriptions' |  mv-expand managementGroupParent = properties.managementGroupAncestorsChain | where managementGroupParent.name =~ '$($mgmtGrp.Name)'"
        $graphResult = Search-AzGraph -Query $Query -ManagementGroup $mgmtGrp.Name -First 200
        if(($graphResult.count -gt 0) -and ( $graphResult.properties.state -eq 'enabled')){$subscriptions += $graphResult.subscriptionid}
    }
}

# clean array to get unique subscriptions
$subscriptions = $subscriptions | select-object -Unique

# iterate Subscriptions to check for existing tags, and if missing, create new
foreach($subscription in $subscriptions){
    # query to see if a Goverance rule already exists
    write-output "checking $subscription for existing tags"

    # get subscription tags
    $tags = Get-AzTag -ResourceId /subscriptions/$subscription
    $owner = $tags.Properties.TagsProperty."owner"
    If(-not (($owner) -or ([mailaddress]$owner))){
        write-output "no valid owner email address $owner found for subscription $subscription"

        $deploymentParameters = @{
            displayName = "Governance tags for subscription : $subscription"
            tags = @{
                owner = $TagOwner
            }
        }

        $parameters = @{
            templateFile        = '.\modules\shared\governance-tags.bicep'
            templateParameterObject = $deploymentParameters
            location = 'WestEurope'
        }

        #select azure subscription to deploy into
        Select-AzSubscription -Subscription $subscription

        #deploy tag Bicep
        New-AzDeployment @parameters -Verbose
    }
}