# Automatically respond yes to any prompts from the chkdsk command. Which will check for and (/r)epair disk errors and (/f)ix them.
# Restarts the computer immediately, forcing running applications to close, and it will not allow users to abort the restart. Delay before restart is set to 0 seconds, 
# ensuring the restart occurs immediately.

echo y^| chkdsk C: /r /f
shutdown /r /f /t 0
