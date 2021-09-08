#this script will automate reading a book

#get-module for making PS talk
Get-Module Microsoft.PowerShell.Utility

#create new type of object 
Add-Type -AssemblyName System.speech 

#create a new object speech synthesiser 
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer 

#change voice rate
$speak.Rate=2

#change voice to female voice
$speak.SelectVoice('Microsoft Zira Desktop')

#creates variable with script
$script = [pscustomobject] ((Get-Content -Raw C:\github_vscode\Projects\Making_PS_Talk\Script_to_read.txt))

#test
$speak.speak($script)