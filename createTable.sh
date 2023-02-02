#!/bin/bash

createT=$(whiptail --inputbox "Enter Name of Table:" 10 60 --fb --title "Create Table" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then

	if  [ "$createT" = "" ] || [ "${createT//[!0-9]}" != "" ] || [[ $createT =~ ['!@#$%^&*()_+'] ]]; then
		echo "Please Type a name without any special character or numbers" > test_textbox
		whiptail --textbox test_textbox 10 60
		source ../../tableMenue.sh
	else
		if [[ -f $createT ]]; then
			echo "This Table already exists" > test_textbox
			whiptail --textbox test_textbox 10 60
			source ../../tableMenue.sh
		else
			touch $createT
            touch .$createT
			typeset -i numberT;
			numberT=$(whiptail --inputbox "How Many Column:" 10 60 --fb --title "Create Table" 3>&1 1>&2 2>&3)
			while [ 2 -gt "$numberT" ]
			do
				echo "the number of coulmns must be more than 1 coulmn" > test_textbox
				whiptail --textbox test_textbox 10 60
				numberT=$(whiptail --inputbox "How Many Column:" 10 60 --fb --title "Create Table" 3>&1 1>&2 2>&3)
			done
			typeset -i i;
			for ((i=0; i<"$numberT"; i++));
			do
				typeT=$(whiptail --inputbox "PLease Type name of column no.$(( $i + 1 )):" 10 60 --fb --title "Create Table" 3>&1 1>&2 2>&3)
				while [ "$typeT" = "" ] || [ "${typeT//[!0-9]}" != "" ]
				do
					echo "Please Type a name without numbers or empty" > test_textbox
					whiptail --textbox test_textbox 10 60
					typeT=$(whiptail --inputbox "PLease Type name of column no.$(( $i + 1 )):" 10 60 --fb --title "Create Table" 3>&1 1>&2 2>&3)
				done
				echo -n $typeT >> $createT 
				option=$(whiptail --title "Type of coulmn no.$(( $i + 1 )):" --fb --menu "select options:" 15 60 2 \
					"1" "String" \
					"2" "Integer" 3>&1 1>&2 2>&3)
				case $option in 
					1) echo -n "String" >> .$createT;;
					2)  echo -n "Integer" >> .$createT;;
				esac
				if [ "$numberT" -gt "$(( $i + 1 ))" ];then
					echo -n ":" >> $createT;
					echo -n ":" >> .$createT;
				fi
			done
			echo "${createT}'s Table created successfully" > test_textbox
			whiptail --textbox test_textbox 10 60
		fi
	fi
source ../../tableMenue.sh
else
	rm -r $createT;
	rm -r .$createT
	source ../../tableMenue.sh
fi