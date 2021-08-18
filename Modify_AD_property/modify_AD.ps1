<# 
This script will update a user's properties in active
directory 
 #>

 #get name of user changing
 Write-Host "What is the username of the user you want to modify?"
 $username = Read-Host

 #parameter for user that matches input 
 $user = Get-ADUser -filter * -Properties * | where -Property UserPrincipalName -like $username
 
 #get new information
 Write-Host "What is the new last name?"
 $last = Read-Host 
 do {
  Set-ADUser -Identity ($user | select -property distinguishedname) @{name='LastName';expression={$last}}  #error here <<-
  Write-Information 'Last name updated successfully.'
 } while ($user)


