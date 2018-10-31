#!bin/bash

echo "Getting current user"
consoleuser=$( /usr/bin/python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')
userid=$( id -u $consoleuser )

echo "Killing Acrobat"
killall "AdobeAcrobat"

echo "Clearing preferences and caches"
/bin/launchctl asuser $userid rm -rfv ~/Library/Application\ Support/Adobe/Acrobat/*
/bin/launchctl asuser $userid rm -rfv ~/Library/Preferences/com.adobe.Acrobat.Pro.plist

echo "Opening Acrobat again"
open /Applications/Adobe\ Acrobat\ DC/Adobe\ Acrobat.app/

exit 0
