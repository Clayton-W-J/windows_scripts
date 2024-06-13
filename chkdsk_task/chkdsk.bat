# Automatically respond yes to any prompts from the chkdsk command. Which will check for and (/r)epair disk errors and (/f)ix them.
# Restarts the computer immediately, forcing running applications to close, and it will not allow users to abort the shutdown. Delay before shutdown is set to 0 seconds, 
# ensuring the shutdown occurs immediately.

echo y^| chkdsk C: /r /f
shutdown /r /f /t 0
