<# 
This script will update a user's properties in active
directory 
 #>

 #get name of user changing
 Write-Host "What is the username of the user you want to modify?"
 $username = Read-Host
 if((get-aduser -filter * | where -Property UserPrincipalName -like $username))
 {
   write-host $username
 }
 
