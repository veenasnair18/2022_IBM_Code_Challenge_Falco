#!/bin/sh
xterm -e bash -c "roslaunch iq_sim hills.launch"||
xterm -e bash -c "roslaunch iq_sim apm.launch" ||
xterm -e bash -c "roslaunch darknet_ros darknet_ros.launch"|| 
xterm -e bash -c "sh startsitl.sh" 

