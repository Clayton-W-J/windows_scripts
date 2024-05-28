schtasks /create /tn "RunChkdskAndShutdown" /tr "path\to\.bat\" /sc once /st 17:00 /rl highest /f
