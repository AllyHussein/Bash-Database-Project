#!/bin/bash
read -p "Enter Database Name: " dbname
if [ `echo $dbname | wc -w` -eq 1 ] #check number of arguments
then
if [ $((dbname)) != $dbname ] #check data type
then
if [ -d ./databases/$dbname ] #check existance
then
echo "Database $dbname already exists!!"
else
mkdir ./databases/$dbname
echo "Database $dbname has been created succesfully"
fi
else
echo "Database name must be a string"
fi
else
echo "Please enter one argument"
fi
