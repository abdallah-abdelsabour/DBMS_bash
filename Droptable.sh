#!/bin/bash

table=$(whiptail --inputbox "Enter Name Of table you Want drop :" 8 39 Blue --title "Drop table.." 3>&1 1>&2 2>&3)
if [ -f $table ];
then 
	rm -r $table ;
    rm -r .$table ;
    whiptail --title "Drop table" --msgbox " $table table have been droped succefully" 8 78
    source ../../tableMenu.sh
else
	if (whiptail --title "Eroor" --yesno ".there is no table called $table \n\n\n\n \
		click Yes to Correct name\click No to Main Menue" 15 78); then
		source ../../tableMenu.sh
    else
	    source ../../tableMenu.sh
    fi
fi