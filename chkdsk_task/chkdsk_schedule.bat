#So, the command creates a new scheduled task named "RunChkdskAndShutdown" that will run a batch file located at "path\to\.bat\" once, starting at 5:00 PM, with the highest privileges. 
#If a task with the same name already exists, it will be overwritten without prompting for confirmation.

schtasks /create /tn "RunChkdskAndShutdown" /tr "path\to\.bat\" /sc once /st 17:00 /rl highest /f
