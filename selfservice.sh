#!/bin/bash

/usr/bin/osascript -e 'display alert "ADSelfService Plus" message "Please take the time to enroll with ADSelfService Plus so you can make use of password self-service" as critical buttons {"Cancel","Enroll"} default button "Enroll"

set response to button returned of the result

if response is "Enroll" then open location "https://pwr.sothebys.com/"'

exit 1
