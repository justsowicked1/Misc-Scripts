#!/bin/bash
SN=$(system_profiler | grep 'r (system)' | tail -1 | awk '{print $4}')
scutil --set LocalHostName FL_$SN
scutil --set ComputerName FL_$SN


adlicense -l

adjoin -V -u ben.burton -p ___Sanguine7___ --container "OU=Mac Laptops,OU=Flamingo-UK,OU=SYSTEMUPDATES,DC=glassmill,DC=local" --zone default --force glassmill.local

adgpupdate
exit 0
