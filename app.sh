#!/bin/bash 
option=$(whiptail --title "Main Menu" --fb --menu "select options:" 15 60 4 \
		"1" "Creat DataBase" \
		"2" "List DataBase" \
		"3" "Connect To DataBase" \
		"4" "Drop DataBase" 3>&1 1>&2 2>&3)


case $option in 
	1) source ./createDB.sh ;;
	2) source ./listDB.sh ;;
	3) source ./ConnectDb.sh ;;
	4) source ./DropDB.sh ;;
esac
