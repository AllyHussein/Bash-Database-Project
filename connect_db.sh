#!/bin/bash
. ./list_db.sh
read -p "Select Database: " connect_db
if [ -d ./databases/$connect_db ] #check existance
then 
while true
do 
echo 1.Create Table
echo 2.List Tables
echo 3.Drop Table
echo 4.Insert into Table
echo 5.Select From Table
echo 6.Delete From Table
echo 7.Update Table
echo 8.Exit 

read -p "Enter Your Choice: " choice
case $choice in
1). ./create_table.sh
     ;;
2). ./list_tables.sh
     ;;
3). ./drop_table.sh
     ;;
4). ./insert_data.sh
     ;;
5). ./select.sh
     ;;
6). ./delete_record.sh
     ;;
7). ./update_table.sh
     ;;
8) echo exit
   break;;
*) echo $choice is not a valid option
esac
done
else
echo "Database does not exist !!"
. ./connect_db.sh
fi
