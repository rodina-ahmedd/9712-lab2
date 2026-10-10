#!/bin/bash
if [ -z "$(ls -A "$2")" ]
then
echo "No malicious files to review."
exit 0
fi
n=1
for file in "$2"/*
do
    echo "$n" $(basename "$file")
    n=$((n + 1))

done
echo -n "choose a file  "
read choice
echo "you chose $choice"

i=1
for file in "$2"/*
do
    if [ "$i" = "$choice" ]
    then 
	selected=$(basename "$file")
    fi
    i=$((i + 1))
done
echo "selected: $selected"

 echo "1 restore"
 echo "2 delete permanently"
 echo "3 back to list"
 echo -n "choose option: "
read option
if [ "$option" = "1" ]
then
    mv "$2/$selected" "$1"
    echo "Restored $selected to $1." 
    echo "$selected" >> whitelist.txt
fi
if [ "$option" = "2" ]
then 
    rm "$2/$selected" 
    echo "$selected permanently deleted."
fi
