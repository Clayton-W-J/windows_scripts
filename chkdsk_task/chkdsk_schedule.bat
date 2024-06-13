# So, the command creates a new scheduled task named "RunChkdskAndRestart" that will run a batch file located at "path\to\.bat\" once, at the desired time, with the highest privileges. 
# If a task with the same name already exists, it will be overwritten without prompting for confirmation.

schtasks /create /tn "RunChkdskAndRestart" /tr "path\to\.bat\" /sc once /st 17:00 /rl highest /f
