<#
this script will create a new scheduled task 
task action
task trigger
#>
$trig=New-ScheduledTaskTrigger -Weekly -DaysOfWeek[]