#!/bin/bash
devName="MyVirtualCam"
devPort=1935 #default 1935

if [ "$EUID" -ne 0 ]
  then echo "Cannot set some parameters"; echo "Are you root?"
  exit
fi

FILES=/dev/video*
isDevAvail=0
for f in $FILES
do
    #echo $(echo "$f" | cut -c6-)
    #cat /sys/class/video4linux/$(echo "$f" | cut -c6-)/name
    if [ "$(cat /sys/class/video4linux/$(echo "$f" | cut -c6-)/name)" == "$devName" ]; then
        isDevAvail=1
    fi
done

if (( isDevAvail == 0 )); then
    echo "Assigning $devName"
    sudo modprobe v4l2loopback devices=1 card_label=$devName exclusive_caps=1,1,1,1,1,1,1,1
else
    echo "$devName allready assigned"
fi

for f in $FILES
do
    if [ "$(cat /sys/class/video4linux/$(echo "$f" | cut -c6-)/name)" == "$devName" ]; then
        echo "Starting $devName from $f"
        echo "Set OBS stream server as rtmp://localhost:$devPort/virtualCam and Start Streaming"
        echo
        ffmpeg -f flv -listen 1 -i rtmp://localhost:$devPort/virtualCam -f v4l2 -vcodec rawvideo $f
        echo "$devName stopped"
    fi
done
