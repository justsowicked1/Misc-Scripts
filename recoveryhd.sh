#!/bin/sh

recoveryHDPresent=`/usr/sbin/diskutil list | grep "Recovery HD"`
recoveryVolumePresent=`/usr/sbin/diskutil list | grep "APFS Volume Recovery"`

if [[ "$recoveryHDPresent" != "" ]] || [[ "$recoveryVolumePresent" != "" ]] ; then
    echo "<result>Present</result>"
else
    echo "<result>Not Present</result>"
fi
