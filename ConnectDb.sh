#!/bin/bash

database=$(whiptail --inputbox "Enter Name Of DataBase you Want connect :" 8 39 --title "connect Database.." 3>&1 1>&2 2>&3)

echo "the answer is $?"
if [[ $database =~ [^a-zA-Z] ]]; then
	#handle the error here 
	#@todo:handle exit code
	#
whiptail --title "Errro " --msgbox "make sure no space or special charchter" 8 78
echo "exit code equal  $?"
source ./ConnectDb.sh

fi

#after handle spaces and specila charcter
if [ -d DBs/$database ] ; then
source ./tableMenue.sh $database 


	echo "folder exist"

else


whiptail --title "Errro " --msgbox "No database called $database" 8 78
source ./app.sh
	fi









