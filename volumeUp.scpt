set currentVolume to output volume of (get volume settings)
set volume output volume (currentVolume + 2)
do shell script "afplay /System/Library/LoginPlugins/BezelServices.loginPlugin/Contents/Resources/volume.aiff > /dev/null 2>&1 &"
