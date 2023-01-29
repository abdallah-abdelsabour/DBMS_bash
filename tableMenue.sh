##!/bin/bash 

cd ./DBs/$1
echo $1
pwd
option=$(whiptail --title "Main Menu" --fb --menu "select options:" 20 60 10 \
		"1" "Creat table" \
		"2" "List Tables" \
		"3" "dro Tables" \
		"4" "insert into Tables" \
		"5" "select from table" \
		"6" "Delete from Tables" \
		"7" "update Table" 3>&1 1>&2 2>&3)

# echo $option ;
case $option in 
2) cd .. ; source ./listTables.sh ;;
esac
		
		
