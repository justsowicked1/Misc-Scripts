#!/bin/sh
rm -rfv /var/db/RemoteManagement  
rm -v /Library/Preferences/com.apple.RemoteDesktop.plist  
rm -rv /Library/Application\ Support/Apple/Remote\ Desktop/ 
rm -rfv ~/Library/Containers/com.apple.RemoteDesktop
rm ~/Library/Preferences/com.apple.RemoteDesktop.plist
rm -rfv ~/Library/Application\ Support/Remote\ Desktop/
exit 0

