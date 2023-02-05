#!/bin/bash

nameT=$(whiptail --inputbox "which table you want to delete from?" 10 60 --fb --title "Create Table" 3>&1 1>&2 2>&3)
if [[ -f $nameT ]]; then
    awk '{print NR,$0}' $nameT > View_Table
    whiptail --textbox --scrolltext View_Table 12 80 --title "Find The Row You Want To Delete"
	numberT=$(whiptail --inputbox "please type no. of row you want to delete?" 10 60 --fb --title "Create Table" 3>&1 1>&2 2>&3)
    
    if [[ $numberT =~ [1] ]]; then
        echo "Header Can't be Deleted" > test_Table
        whiptail --textbox test_Table 10 60
        rm -r test_Table
        rm -r View_Table
        source ../../deleteFromTable.sh
    elif [[ $numberT =~ [2-9] ]]; then
        `sed -i ''$numberT'd' $nameT`
        echo "deleted successfully" > test_Table
        whiptail --textbox test_Table 10 60
        rm -r test_Table
        rm -r View_Table
        source ../../tableMenue.sh
    else
        echo "please type number" > test_Table
        whiptail --textbox test_Table 10 60
        rm -r test_Table
        source ../../deleteFromTable.sh
    fi
else
    echo "This Table Doesn't Exist" > test_Table
    whiptail --textbox test_Table 10 60
    rm -r test_Table
    rm -r View_Table
	source ../../tableMenue.sh
fi  