##!/bin/bash 

cd ./DBs/$1
echo $1
pwd
option=$(whiptail --title "Main Menu" --fb --menu "select From:" 20 60 10 \
		"1" "Create table" \
		"2" "List Tables" \
		"3" "drop Table" \
		"4" "insert into Table" \
		"5" "select from table" \
		"6" "Delete from Table" \
		"7" "Update From Table" \
		"8" "Exit" 3>&1 1>&2 2>&3)

# echo $option ;
case $option in 
1) source ../../createTable.sh ;;
2) source ../../listTables.sh ;;
3) source ../../Droptable.sh ;;
4)  source ../../insertIntoTable.sh ;;
5) source ../../selectFromTable.sh  ;;
6) source ../../deleteFromTable.sh  ;;
7) source ../../updateTable.sh ;;
8) exit ;;
esac
