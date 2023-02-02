#!/bin/bash 
echo -e "list all table " > DBList
echo -e "|Database Name | number of table|" >>DBList
for folder in DBs/* 
	do

		set x-

		echo "|-------------------------------|" >> DBList
		echo "|" $(basename $folder) "                  " $(ls -l $folder |wc -l )  >> DBList
		set x+
done


whiptail --scrolltext --textbox  DBList  $LINES $COLUMNS $(( $LINES - 12 ))
source ./app.sh

