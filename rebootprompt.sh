#!/bin/bash

note_txt="Your computer has been running for over a month and needs to update. Please save all your work and reboot when you can. This message will go away in a moment, but will appear daily until you have restarted. 

Your Mac has been booted since: `echo "$(date -jf "%s" "$(sysctl kern.boottime | awk -F'[= |,]' '{print $6}')" +"%Y-%m-%d %T")"`

If you have any questions, please contact the Helpdesk.";
 
titl_txt="Sotheby's IT Notification";

if [[ -z ${titl_txt} ]]; then 
    titl_txt="Management Notification";
    else 
    titl_txt="${titl_txt}";
fi

/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -timeout 120 -countdown -windowType hud -alignDescription left -button2 "Restart now" -button1 "Maybe later" -lockHUD -defaultButton 1  -icon "/Applications/System Preferences.app/Contents/Resources/PrefApp.icns" -title "${titl_txt}" -description "${note_txt}";

if [[ "$?" -ne 0 ]]; then
osascript -e 'tell application "System Events" to restart';
fi

exit 0;
