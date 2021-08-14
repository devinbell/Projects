<# SCRIPT TO IMPORT DATA FROM CSV INTO ADUSERS, 
THEN MOVE USERS INTO OUs BY STATE, 
THEN CREATE DISTRO GROUP WITH EVERYONE IN EACH STATE#>

#IMPORT DATA                                                                                  REMOVES ANY DUPLICATE ACCOUNTS
$csvinfo = import-csv -LiteralPath "C:\github\Projects\AD_BUILD_FROM_CSV\smallfakeinfo.txt" | sort-Object -property username -Unique

#FOREACH LOOP TO CREATE ADUSER FOR EACH ROW FROM CSV.
$csvinfo | foreach{ 
New-ADUser -name $_.name -GivenName $_.givenname -Surname $_.surname -StreetAddress $_.streetaddress -City $_.city -State $_.statefull  `
-EmailAddress $_.emailaddress -UserPrincipalName $_.username -MobilePhone $_.telephonenumber -Company $_.company -DisplayName $_.name  `
 -PostalCode $_.zipcode -SamAccountName $_.username -OtherAttributes @{'title' = $_.occupation; 'carLicense' = $_.vehicle ; 'Middlename' = $_.middleinitial}

#SET ACCOUNT PASSWORD FOR EACH USER
Set-ADAccountPassword -Identity (((get-aduser -filter * -Properties *) | Where name -eq $_.name) | select distinguishedname) -OldPassword $null -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $_.password -force) 

#ENABLE EACH ACCOUNT FOR USE
Enable-ADAccount -Identity (((get-aduser -filter * -Properties *) | Where name -eq $_.name) | select distinguishedname) }

<#IF STATEMENT TO CREATE OU IF NOT ALREADY CREATED..
OR MOVE ADUSER INTO THE OU ORGANIZED BY STATE#>

$user=get-aduser -filter * -Properties state

#FOREACH TO CHECK IF EACH USER MATCHES AN OU AND IF SO MOVE IT IF NOT CREATE IT THEN MOVE IT
$user | 
     ForEach-Object -process {
          if($null -eq $_.state) {
               Write-Host "Not Moving" $_.Name" account into an OU"
          } else { 
               $ou = Get-ADOrganizationalUnit -filter * | where name -eq $_.state
               if($ou) {
                    Move-ADObject -Identity $_.distinguishedname -TargetPath $ou.distinguishedname 
                    } else { 
                         New-ADOrganizationalUnit -name $_.state -Path "DC=BELL,DC=LOCAL" -ProtectedFromAccidentalDeletion $false;

                         if($ou) {
                              Move-ADObject -Identity $_.distinguishedname -TargetPath $ou.distinguishedname #| 
                             # select distinguishedname 
                             } 
                             }
                    }
     }
#CREATE A DISTRO GROUP IN EACH OU AND ALL MEMBERS OF THE OU TO THE GROUP
$user | 
     ForEach-Object -process {
          if($null -eq $_.state) {
               Write-Host "Not Moving" $_.Name" account into a group1"
          } else {
               if((Get-ADGroup -filter * )| where name -eq $_.state) {
                    Move-ADObject -Identity $_.distinguishedname -TargetPath ((Get-ADgroup -filter *) | where name -eq $_.state) | 
                    select -ExpandProperty distinguishedname 
               } else {
                    New-ADgroup -name $_.state -GroupScope Global -GroupCategory Distribution -Path (((Get-ADOrganizationalUnit -filter *) | where name -eq $_.state) |
                     select -ExpandProperty distinguishedname)
                     
                     if(Get-ADgroup -filter * | where name -eq $_.state) {
                          Move-ADObject -Identity $_.distinguishedname -TargetPath ((Get-ADgroup -filter *) | where name -eq $_.state) | 
                          select -ExpandProperty distinguishedname 
                         } else { 
                              write-host "Not Moving" $_.Name" account into a group2"
                         }
                    } 
               }
          }

#REMOVE ALL CREATED USERS AND OUs TO RETEST
get-aduser -Properties * -filter * | where -Property state -ne $null | remove-aduser;
Get-ADOrganizationalUnit -filter * | where -Property name -ne "Domain Controllers" | Remove-ADOrganizationalUnit;

