#!/bin/bash
#Написать свою реализацию ps ax используя анализ /proc
#
#

PrintCommandf(){
	if [ -f /proc/$1/cmdline ]; then
		commen=$(cat /proc/$1/cmdline | tr -d "\0" | tr -s "^@" "\n")
		if [ ${#commen} -eq 0 ]; then
			commen="["$(cat /proc/$1/comm | tr -d "\0" | tr -s "^@" "\n")"]"
		fi
	fi
	echo $commen

}

PrintSatatus(){
	state=`awk '{ print $3}' /proc/$1/stat`
	echo $state
}

PrintTTY(){
	numdives=`awk '{ print $7}' /proc/$1/stat`
	if [ $numdives -eq 0 ]; then
		echo "?"
	else
		let "major = $numdives >> 8"
		let "minor = $numdives ^ ($major << 8)"

#		ttymajor=`ls -l /dev/ |  awk '{if ($5 == "$major," && $6 == "$minor") print $10}'`

		echo $major","$minor","$ttymajor
	fi
}
PrintTime(){

	echo "0:00"
}

printf "%+5s %-8s %-6s %04s %-s\n" "PID" "TTY" "STAT" "TIME" "COMMAND"

for DirProcess in `ls -1 /proc | grep -E ^\-?[0-9]?\.?[0-9]+$  | sort -g`
do
	if [ -d /proc/$DirProcess ]; then
		printComm=$(PrintCommandf $DirProcess)
		printTTY=$(PrintTTY $DirProcess)
		printSatatus=$(PrintSatatus $DirProcess)
		printf "%5s %-8s %-6s %04s %s\n" $DirProcess "$printTTY" "$printSatatus" "0:00" "$printComm" | head -c `tput cols`
#		printf "%b\n" "$printComm" | head -c `tput cols`
	fi
done

#tr -s "^@" "\n"
#head -c `tput cols`
