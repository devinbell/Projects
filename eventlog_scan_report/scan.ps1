<#
This script will scan a event log, react to an error, log 
results
#>

#get the event log from the last week and scan entries
$eventlog = Get-Eventlog -LogName Application -Before (Get-Date) -after ((get-date).AddDays(-7))
$count = 0
#foreach loop to scan the event log
ForEach($event in $eventlog){

    if($event.EntryType -eq "WARNING"){
        write-host "ERROR: $($event.Source) had an error, logging the error" -ForegroundColor Red

        #write warning to file
        $event | Out-File -FilePath C:\temp\logErrors.txt -NoClobber -Append
        $count += 1
        
    }
    else{

        write-host "no issues found with $($event.Source)!" -ForegroundColor Green
    }

}
#creates pop up box to display number of warning and location of log
$Box = new-object -ComObject wscript.shell
$output = $box.popup("there were $count warnings. Check the log in C:\temp")

#if there are more than 10 warnings email administrators