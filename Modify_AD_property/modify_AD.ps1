<# 
This script will update a user's properties in active
directory 
 #>

 #get name of user changing
 Write-Host "What is the username of the user you want to modify?"
 $username = Read-Host
 $user = Get-ADUser -filter * -Properties* | where -Property UserPrincipalName -like $username

 if($user){
   write-host "$_.name is a valid option"
 }
 
else{
   Write-Host "invalid option, choose again"
}

