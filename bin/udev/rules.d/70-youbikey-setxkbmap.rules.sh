#!/bin/sh -xe

export PATH=/bin:/usr/bin
export DISPLAY=:0
DEVICE=$(xinput list | sed -n 's!.*Yubikey.*id=\([0-9]*\).*keyboard.*!\1!p')
LOG=/tmp/udev.hook.log

date >>$LOG
sleep 2
echo DEVICE=$DEVICE >>$LOG

if test -z "$DEVICE"
then
    echo "Couldn't get a DEVICE"
    exit 1
fi

setxkbmap -device $DEVICE -layout us >>$LOG 2>&1
