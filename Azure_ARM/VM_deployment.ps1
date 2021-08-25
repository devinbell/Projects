#deploy VM to myNetwork
New-AzResource `
-ResourceGroupName 'myNetwork' `
-templatefile "C:\github\projects\azure_ARM\VM.json" `
-ResourceName 'VM2'