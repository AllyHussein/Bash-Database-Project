#!/bin/bash
read -p "Enter Table Name: " table_name
 if [ `echo $table_name | wc -w` -eq 1 ]
 then
 if [ $((table_name)) != $table_name ] #check it is string or not
 then
 if [ -f ./databases/$connect_db/$table_name ] #check_existance
 then 
 echo "Table $table_name already exists!!"
 create_table.sh
 else
 declare -a values #array for fileds
 declare -a types #array for data types
 counter=0
 pkeycounter=-1

 echo "Please enter table fields and data types below!"
 while true
 do
 echo 1.Create Fields
 echo 2.Exit
 read -p "Enter Your choice: " choice
 case $choice in
 1) 
   read -p "Field name: " var1
   read -p "Data type (int or str): " var2 
   if [ $var2 = int -o $var2 = str ] #correct data type
   then
   if [ $pkeycounter -eq -1 ] #no pk inserted
   then
   read -p "do you wanna make this attribute primary key!?(y for yes n for no): " ans
   case $ans in
   [Yy]* ) values[$counter]+="$var1:"
           types[$counter]+="(p)$var2:"
           let pkeycounter=$counter 
           let counter=$counter+1
            ;;
   [Nn]* ) values[$counter]+="$var1:"
           types[$counter]+="$var2:"
           let counter=$counter+1  
            ;;
   *) echo "Please, press y or n"
      ;;
   esac
   else 
   values[$counter]+="$var1:"
   types[$counter]+="$var2:"
   let counter=$counter+1
   fi
   else 
   echo "Wrong data type!"
   fi
     ;;
 2) 
   break;;
 *) $choice is not a valid option
 esac
 done

 touch ./databases/$connect_db/$table_name
 echo $counter >  ./databases/$connect_db/$table_name #number of columns
 echo $pkeycounter >> ./databases/$connect_db/$table_name #pk index
 printf %s "${types[@]}" $'\n' >> ./databases/$connect_db/$table_name
 printf %s "${values[@]}" $'\n' >> ./databases/$connect_db/$table_name
 echo "Your Table created Successfully"
 ./menu.sh
 fi
 else
 echo "Table Name Must be a String"
 fi
 else
 echo "Please enter one argument!"
 fi

