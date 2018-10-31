#! /bin/bash

echo "Quitting Chrome"
killall "Google Chrome"

echo "Removing modified system level Google Software Update"
rm -rf /Library/Google/GoogleSoftwareUpdate


echo "Removing modified user level Google Software Update"
rm -rf ~/Library/Google/GoogleSoftwareUpdate

echo "Reopening Chrome in 5 seconds"
sleep 5
open /Applications/Google\ Chrome.app

exit 0