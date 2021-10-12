<#
This script will scan a event log, react to an error, log 
results
#>

#get the event log and scan entries
$eventlog = Get-Eventlog -LogName System

