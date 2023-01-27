#!/bin/bash

database=$(whiptail --inputbox "Enter Name Of DataBase you Want drop :" 8 39 Blue --title "Drop Database.." 3>&1 1>&2 2>&3)
set -x
if [ -d DBs/$database ];
then 
	rm -rf DBs/$database ;
whiptail --title "Drop Database" --msgbox " $database database have been droped succefully" 8 78
source ./app.sh
else

	if (whiptail --title "Eroor" --yesno ".                   there is no database called $database \n\n\n\n \
		click Yes to Correct name             \
		click No to Main Menue" 15 78); then
		source ./DropDB.sh
else
	source ./app.sh
fi
fi
set +x
