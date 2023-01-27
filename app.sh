#!/bin/bash 
option=$(whiptail --title "Main Menu" --fb --menu "select options:" 15 60 4 \
		"1" "Creat DataBase" \
		"2" "List DataBase" \
		"3" "Conect To DataBase" \
		"4" "Drop DataBase" 3>&1 1>&2 2>&3)

echo $?
case $option in 
	1) 
      source ./createDB.sh ;;
	2) source ./listDB.sh ;;
	3) echo 3 ;;
	4)source ./DropDB.sh ;;
esac
