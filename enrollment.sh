#!/bin/bash
sleep 1

echo "Getting current user"
consoleuser=$( /usr/bin/python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')
userid=$( id -u $consoleuser )


echo 'Displaying Name prompt'
NAME="$(/bin/launchctl asuser $userid osascript -e 'Tell application "System Events" to display dialog "Please enter a machine name, i.e LNDM123456:" default answer "LNDM123456" with title "Name" with text buttons {"OK"} default button 1' -e 'text returned of result')"
sleep 1

echo "Setting name"
/usr/sbin/scutil --set ComputerName "$NAME"
/usr/sbin/scutil --set HostName "$NAME"
/usr/sbin/scutil --set LocalHostName "$NAME"
sleep 1 

echo "Set Computername to `scutil --get ComputerName`"
echo "Set Hostname to `scutil --get HostName`"
echo "Set LocalHostname to `scutil --get LocalHostName`"


#echo "setting network time" 
#TIMEZONE="$(/bin/launchctl asuser $userid osascript -e 'Tell application "System Events" to display dialog "Please enter a timezone, i.e Europe/London, America/New_York, Asia/Hong_Kong or Europe/Paris" default answer "Europe/London" with title "Timezone" with text buttons {"OK"} default button 1' -e 'text returned of result')" 
#systemsetup -settimezone "$TIMEZONE" 
#systemsetup -setusingnetworktime on 
#systemsetup -setnetworktimeserver time.apple.com 
#sleep 1 

echo "setting remote events, SSH"
systemsetup -setremoteappleevents on
systemsetup -f -setremotelogin on
dscl . append /Groups/com.apple.access_ssh user localadmin
sleep 1

echo "Opening Self Service"
open /Applications/Self\ Service.app/
sleep 2

echo "Running a Jamf recon so the JSS has the updated name and can scope some software"
/usr/local/bin/jamf recon
sleep 2

echo "Running a Jamf Policy call for the rest of the software"
/usr/local/bin/jamf policy

exit 0