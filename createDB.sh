#!/bin/bash
if [-d ./DB ] 
then 
	mkdir ./DB
fi

DB_name = $(whiptail --inputbox "Enter name of DataBase: " 8 39 --title "create database" >3>&1 1>&2 2>&3 )
