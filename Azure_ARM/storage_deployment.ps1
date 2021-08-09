#create resource group 
New-AzResourceGroup -name 'myNetwork' -location "Central US" -force

#deploy the storage
New-AzResourceGroupDeployment -name "New-storage1" -resourcegroupname 'myNetwork' -templatefile 'storage.json'

