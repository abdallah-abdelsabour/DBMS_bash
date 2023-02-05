#!/bin/bash

selectT=$(whiptail --inputbox "Type the name of the table to select it:" 10 60 --fb --title "Table $selectT" 3>&1 1>&2 2>&3)

if [ "$selectT" = "" ];then
	whiptail --title "Error" --msgbox "PLease Type a Table" 8 78
elif [ -f $selectT ]; then
	tail -n +2 $selectT > test_textbox
	whiptail --textbox --scrolltext test_textbox 12 80 --title "$selectT"
	rm -r test_textbox
else
    whiptail --title "Error" --msgbox "This Table Doesn't exist" 8 78
fi
source ../../tableMenue.sh