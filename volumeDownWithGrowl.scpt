set currentVolume to output volume of (get volume settings)
set volume output volume (currentVolume - 2)
do shell script "afplay /System/Library/LoginPlugins/BezelServices.loginPlugin/Contents/Resources/volume.aiff > /dev/null 2>&1 &"

tell application "System Events"
	set isRunning to (count of (every process whose bundle identifier is "com.Growl.GrowlHelperApp")) > 0
end tell

if isRunning then
	set message to "Dropped the volume by 2 notches. Current volume is " & currentVolume - 2 & "%"
	
	tell application id "com.Growl.GrowlHelperApp"
		-- Make a list of all the notification types 
		-- that this script will ever send:
		set the allNotificationsList to {"Volume Down"}
		
		set the enabledNotificationsList to ¬
			{"Volume Down"}
		
		register as application ¬
			"Incremental Volume Shortcut - Down" all notifications allNotificationsList ¬
			default notifications enabledNotificationsList ¬
			
		notify with name ¬
			"Volume Down" title ¬
			"Volume Down" description ¬
			message application name "Incremental Volume Shortcut - Down"
		
	end tell
end if
