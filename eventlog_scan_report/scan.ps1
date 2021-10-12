<#
This script will scan a event log, react to an error, log 
results
#>

#get the event log from the last week and scan entries
$eventlog = Get-Eventlog -LogName System -Before (Get-Date) -after ((get-date).AddDays(-7))

