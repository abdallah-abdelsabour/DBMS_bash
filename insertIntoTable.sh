#!/bin/bash
tables=$(ls -1 )
table=$(whiptail --scrolltext --inputbox "Enter Name table \n $tables " 30 60 --fb --title "INSERT INTO TABLE" 3>&1 1>&2 2>&3)
if [[ $table =~ [^a-zA-Z] ]]; then
	#handle the error here 
	#@todo:handle exit code
	#
whiptail --title "Errro " --msgbox "make sure no space or special charchter or numbrs" 8 78
source ../../insertIntoTable.sh
fi

if [[ ! -f $table ]];
 then
whiptail --title "Errro " --msgbox "no table called $table" 8 78
source ../../tableMenue.sh
fi

# record=$(whiptail --scrolltext --inputbox "Enter your record  \n " 30 60 --fb --title "NEW RECORD" 3>&1 1>&2 2>&3)

IFS=":" read -ra words < <(head -n 1 .$table)
dataType=("${words[@]}")
length=${#dataType[@]}
# echo "how length $length"
# echo "second type ${dataType[0]}"
new_record=()
typeset -i i;

# insert the new record
for ((i=0; i<${length}; i++));
			do
f=$(whiptail --scrolltext --inputbox "Enter value ${dataType[i]} of colum $(($i+1))  \n " 30 60 --fb --title "NEW RECORD" 3>&1 1>&2 2>&3)
new_record+=("$f")
      done
# validate the record   
# echo "${new_record[@]}"   

typeset -i l;

# dataType[]
# new_record[]

for ((l=0; l<${length}; l++));
do


# echo "${dataType[l]}"

if [[ ${dataType[l]} =~ "Integer" ]];
then
  if [[ ! ${new_record[l]} =~ [0-9] ]]; then
    whiptail --title "Errro " --msgbox "not valid data type please enter type same as header say " 8 78
    source ../../tableMenue.sh
  fi 
fi

# valid no empty string 
if [[ ${dataType[l]} =~ "String" ]];
then
  if [[ ${new_record[l]} = "" ]]; then
    whiptail --title "Errro " --msgbox "not valid  type record cant be empty " 8 78
    source ../../tableMenue.sh
  fi 
fi



done
# insert the record
echo "" >> $table
typeset -i j;
			for ((j=0; j <${#new_record[@]} ; j++));
      do
      if [[ $j -lt $(( $length -1 )) ]];
      then
        echo -n "${new_record[j]}" >> $table
        echo -n ":" >> $table
   else 
    echo -n "${new_record[j]}" >> $table
    whiptail --title "SUCCESS " --msgbox "new record addedd succeffuly" 8 78
    source ../../tableMenue.sh

      fi
      

      done
      






