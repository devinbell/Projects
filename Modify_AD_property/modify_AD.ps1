<# 
This script will update a user's properties in active
directory 
 #>
do {
    #get name of user changing
     Write-Information -MessageData "What is the username of the user you want to modify?" -InformationAction Continue
     $username = Read-Host

     #parameter for user that matches input 
     $user = Get-ADUser -filter * -Properties * | where -Property UserPrincipalName -like $username

     #keep repeating until correct username is given
} while ($null -eq $user)
 
#update user AD profile
 if($user){

      #get new information
      Write-Information -MessageData  "What is the new last name?" -InformationAction Continue
     $last = Read-Host 
     $FirstName = $user.GivenName

     #update AD-user
     Set-ADUser -Identity $user.distinguishedname -Surname $last -displayName "$FirstName $last" 
     Rename-ADObject -Identity $user.DistinguishedName -NewName "$FirstName $last" 
     #inform user action complete
     Write-Information -MessageData 'Last name updated successfully.' -InformationAction Continue
 }
