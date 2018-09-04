#!/bin/bash
#Написать свою реализацию ps ax используя анализ /proc
#
#


printf "%+5s %-8s %-6s %04s %-s\n" "PID" "TTY" "STAT" "TIME" "COMMAND"

for DirProcess in `ls -1 /proc | grep -E ^\-?[0-9]?\.?[0-9]+$  | sort -g`
do
	if [ -d /proc/$DirProcess ]; then
		printf "%5d %-8s %-6s %04s %-s\n" $DirProcess "?" "Is<" "0:00" "systemd"
	fi	
done
