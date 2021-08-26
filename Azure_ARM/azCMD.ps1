#this file will be used for practicing basic azure CL

#connect account will open broswer to log into azure account 
Connect-AzAccount

#starts VM scale set 
Start-AzVmss -VMScaleSetName -ResourceGroupName

#returns all VMs in the resource group
Get-AzVM -ResourceGroupName