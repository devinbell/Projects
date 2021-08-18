<# 
This script will update a user's properties in active
directory 
 #>
do {
    #get name of user changing
     Write-Host "What is the username of the user you want to modify?"
     $username = Read-Host

     #parameter for user that matches input 
     $user = Get-ADUser -filter * -Properties * | where -Property UserPrincipalName -like $username

     #keep repeating until correct username is given
} while ($null -eq $user)
 
 
 #update user AD profile
 if($user){
      #get new information
     Write-Host "What is the new last name?"
     $last = Read-Host 
     $FirstName = $user.GivenName
     
     Set-ADUser -Identity $user.distinguishedname -Surname $last -displayName "$FirstName $last" -
     
     Write-Information 'Last name updated successfully.'
 }



