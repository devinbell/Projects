#this file will be used for practicing basic azure CL

#connect account will open broswer to log into azure account 
Connect-AzAccount 

#starts VM scale set 
Start-AzVmss -VMScaleSetName -ResourceGroupName
start-azvm -Name -ResourceGroupName

#returns all VMs in the resource group
Get-AzVM -ResourceGroupName -name

#new AZVMSS    MANDO parameters
new-azvmss -ResourceGroupName -VMScaleSetName
new-azvm -ResourceGroupName -Name

