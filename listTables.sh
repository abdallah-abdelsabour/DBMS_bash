#!/bin/bash

table_list=$(ls -1)
whiptail --title "Tables" --msgbox "$table_list" 30 78
source ../../tableMenue.sh