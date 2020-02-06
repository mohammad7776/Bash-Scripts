#!/bin/bash

#Define Variables
declare -a se
col="$(seq 2 10)"

se[1]="$(( $RANDOM%10 +1 ))"     #Randomly select first value    

for i in $col 
  do
  se[$i]="$(( $RANDOM%10 +1 ))"  #Select Random Values
  for ((n=1;n<$i;n++))           #Search all values for duplicate value
  do
      f=${se[$i]}
      g=${se[$n]}
      if [[ $f == $g ]]; then    #If duplication found
        while [[ $f == $g ]]	 #Until the random number is equal to other values create random number 
        do
            se[$i]=$(($RANDOM%10 +1))
            f=${se[$i]}
        done
        n=0                       #If a duplicate value found, set the flag to 0 to search from begining
      fi    
  done
    
done



echo ${se[@]}                     #Print all values