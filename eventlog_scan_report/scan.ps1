<#
This script will scan a event log, react to an error, log 
results
#>

#get the event log from the last week and scan entries
$eventlog = Get-Eventlog -LogName Application -Before (Get-Date) -after ((get-date).AddDays(-7))

#foreach loop to scan the event log
ForEach($event in $eventlog){

    if($event.EntryType -eq "WARNING"){
        write-host "ERROR: $($event.Source) had an error, logging the error" -ForegroundColor Red
        
        $event | Out-File -FilePath C:\temp\logErrors.txt -NoClobber -Append
        
    }
    else{

        write-host "no issues found with $($event.Source)!" -ForegroundColor Green
    }

}