#Get-AzContext
#Connect-AzAccount -Force
#Get-AzSubscription | Format-Table
Get-AzSubscription | ForEach-Object {Set-AzContext -SubscriptionId $_.Id
    if (Get-AzKeyVaultManagedHsm){}
    else {
        Get-AzKeyVaultManagedHsm -InRemovedState
    }
}