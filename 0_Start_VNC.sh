#!/bin/sh
 ####################################
 #
 # Run VNC on Boot
 #
 ####################################

################################################################
# command for set pass
#                             x11vnc -storepasswd
# and insert # mypassword
###############################################################
# start x11vnc # -forever
sleep 2
echo "root_passoword" | sudo -S x11vnc -rfbauth /home/dell/.vnc/passwd -rfbport 5901 -forever
