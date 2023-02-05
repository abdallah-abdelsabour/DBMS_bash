#!/bin/bash

# list begin
nameT=$(whiptail --inputbox "which table you want to update from?" 10 60 --fb --title "Create Table" 3>&1 1>&2 2>&3)
typeset -i line_count ;

line_count=$(wc -l < "$nameT")


if [[ -f $nameT ]]; then
    awk '{print NR,$0}' $nameT > View_Table
    whiptail --textbox --scrolltext View_Table 12 80 --title "Find The Row You Want To "$line_count"update"
	numberT=$(whiptail --inputbox "please type no. of row you want to update?" 10 60 --fb --title "Create Table" 3>&1 1>&2 2>&3)
    if [[ $numberT =~ [1] ]]; then
        echo "Header Can't be updated" > test_Table
        whiptail --textbox test_Table 10 60
        rm -r test_Table  
        source ../../updateTable.sh


    elif [[ "$numberT" -gt "$line_count" ]]; then

 echo "no record  in line "$numberT" please enter again" > test_Table
        whiptail --textbox test_Table 10 60
        rm -r test_Table  
        source ../../updateTable.sh

    elif [[ $numberT =~ [2-9] ]]; then
#   __________________________________________________________________________  # 
IFS=":" read -ra words < <(head -n 1 .$nameT)
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
typeset -i l;
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
    whiptail --title "Errro " --msgbox "not valid type the record cant be empty " 8 78
    source ../../tableMenue.sh
  fi 
fi

done
# insert the record
# echo "" >> $nameT
typeset -i j;

			for ((j=0; j <${#new_record[@]} ; j++));
      do
      if [[ $j -lt $(( $length -1 )) ]];
      then
        echo -n "${new_record[j]}" >> $nameT
        echo -n ":" >> $nameT
   else 
    echo -n "${new_record[j]}" >> $nameT
    whiptail --title "SUCCESS " --msgbox "new record addedd succeffuly" 8 78
    # source ../../tableMenue.sh

      fi
      done
# _______________________________________________________________________________________________

# end the code here

        `sed -i ''$numberT'd' $nameT`
        source ../../tableMenue.sh
    fi
else
    echo "This Table Doesn't Exist" > test_Table
    whiptail --textbox test_Table 10 60
    rm -r test_Table
    # remove empty line s
    sed '/^$/d' $nameT
	source ../../tableMenue.sh
fi  