<# 
This script will update a user's properties in active
directory 
 #>

 #get name of user changing
 Write-Host "What is the username of the user you want to modify?"
 $username = Read-Host
 $user = Get-ADUser -filter * -Properties * | where -Property UserPrincipalName -like $username
 Write-Host "What is the new last name?"
 $last = Read-Host 

 if($user){
   Set-ADUser -Identity $user @{name='LastName';expression={$last}}
   Write-Information -MessageData 'Last name updated successfully.'
 }

else{
   Write-Host "invalid option, choose again"
}

