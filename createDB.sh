#!/bin/bash

create=$(whiptail --inputbox "Enter Name of DataBase:" 10 60 --fb --title "Create Database" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then

	if  [ "$create" = "" ] || [ "${create//[!0-9]}" != "" ] || [[ $create =~ ['!@#$%^&*()_+'] ]] || [[ $create =~ [' '] ]]; then
		echo "Please Type a name without any special character or numbers or spaces" > test_textbox
		whiptail --textbox test_textbox 10 60
		source ./createDB.sh
	else
		if [[ -d DBs/$create ]]; then
			echo "This Database already exists" > test_textbox
			whiptail --textbox test_textbox 10 60
			source ./createDB.sh
		else
			echo "${create}'s Database created successfully" > test_textbox
			whiptail --textbox test_textbox 10 60
			mkdir DBs/$create
			source ./app.sh
		fi
	fi
rm -r test_textbox
else
	source ./app.sh
fi
