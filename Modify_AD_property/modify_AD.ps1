<# 
This script will update a user's properties in active
directory 
 #>

 #get name of user changing
 Write-Host "What is the username of the user you want to modify?"
 if((get-aduser -filter * | where -Property Name -eq (Read-Host)))
 {
    $username = Read-Host
 }
 
 write-host $username