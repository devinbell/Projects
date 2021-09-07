#this script will automate reading a book

#get-module for making PS talk
Get-Module Microsoft.PowerShell.Utility

#new type of object 
Add-Type -AssemblyName System.speech 

#create a new object speech synthesiser 
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer

#test
$speak.speak{"Hello, World"}

