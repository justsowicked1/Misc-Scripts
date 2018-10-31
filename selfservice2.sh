#!/bin/bash

note_txt="Please take a moment to enroll in Password Self Service, so you can change your password and unlock your account, even while off-network. If now isn't a good time, you can enroll at any time from the Bookmarks section in Self Service.

Remember: IT will never ask for your password or private personal information via email. 

If you have any questions, please speak to our Helpdesk:
Americas +1.212.606.7878 
Europe +44.207.293.6666 
Asia +852.2822.9090"; # Labeled "Notice Text" in script options
info_url="$5"; # Labeled "More Info URL" in script options
titl_txt="Sotheby's IT"; # Labeled "Title (optional)" in script options

if [[ -z ${titl_txt} ]]; then 
    titl_txt="Management Notification";
    else 
    titl_txt="${titl_txt}";
fi



/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType hud -alignDescription left -button2 "Enroll" -button1 "Maybe later" -lockHUD -defaultButton 2 -icon "/Library/Application Support/Sothebys/sothebys.png" -title "${titl_txt}" -description "${note_txt}";

if [[ "$?" -ne 0 ]]; then
    /usr/bin/open "${info_url}";
fi

exit 0;