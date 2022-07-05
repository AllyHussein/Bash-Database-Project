#!/bin/bash
if [ $(ls ./databases | wc -l) -gt 0 ] #check number of databases
then 
ls ./databases
else 
echo "No Databases Found in The System"

while true
do 
read -p "Press y to create a new database or n to return to main menu: " value
case $value in
[Yy]* ) . ./create_db.sh
      ;;
[Nn]* ) echo "You Will be Directed To Main Menu"
      break;;

*) echo "Please press y or n"
      ;;
esac
done
fi
