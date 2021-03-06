#this file will be used for practicing basic azure CL with mandotory parameters

#connect account will open broswer to log into azure account 
Connect-AzAccount 

#new AZVMSS    MANDO parameters
new-azvmss -ResourceGroupName -VMScaleSetName
new-azvm -ResourceGroupName -Name

#starts VM scale set 
Start-AzVmss -VMScaleSetName -ResourceGroupName
start-azvm -Name -ResourceGroupName

#returns all VMs in the resource group
Get-AzVM -ResourceGroupName -name
get-azvmss -ResourceGroupName -VMScaleSetName

#new storage account   
New-AzStorageAccount -Name -SkuName -ResourceGroupName

#new nsg for the virtual network  
New-AzNetworkSecurityGroup -Name -ResourceGroupName -Location

#azure cli 
az.cmd

azAD
