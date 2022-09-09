#!/bin/sh
 ####################################
 #
 # Run VNC on Boot
 #
 ####################################

# start x11vnc # -forever
sleep 2
echo "RutPassword" | sudo -S x11vnc -rfbauth /home/dell/.vnc/passwd -rfbport 5901 -forever
