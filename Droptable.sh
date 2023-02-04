#!/bin/bash

table=$(whiptail --inputbox "Enter Name Of table you Want drop :" 10 60 --title "Drop table.." 3>&1 1>&2 2>&3)
if [ -f $table ];
then 
	rm -r $table ;
    rm -r .$table ;
    whiptail --title "Drop table" --msgbox " $table table have been droped succefully" 8 78
    source ../../tableMenue.sh
else
    echo "This Table Doesn't Exist" > test_textbox
	whiptail --textbox test_textbox 10 60
    rm -r test_textbox
    source ../../tableMenue.sh
fi