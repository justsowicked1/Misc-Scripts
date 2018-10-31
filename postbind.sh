#!/bin/bash
DOMAIN="`dsconfigad -show | grep "Active Directory Domain" | cut -d "=" -f2`"
COMPUTER="`dsconfigad -show | grep "Computer Account" | cut -d "=" -f2`"

/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType "hud" -title "Domain Binding"  -description "Bound to $DOMAIN as $COMPUTER" -button1 "Thanks!" -defaultButton 1 -timeout 15 -countdown -icon /System/Library/CoreServices/Applications/Directory\ Utility.app/Contents/Resources/DirectoryUtility.icns
exit 0
