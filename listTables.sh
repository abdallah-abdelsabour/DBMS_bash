echo -e "list all table " > DBList
echo -e "|Database Name | number of table|" >>DBList
for table in DBs/$1 
	do


		echo "|-------------------------------|" >> DBList
		echo "|" $(basename $folder) "                  " $(ls -l $folder |wc -l )  >> DBList
done


whiptail --scrolltext --textbox  DBList  $LINES $COLUMNS $(( $LINES - 12 ))
source ./app.sh

