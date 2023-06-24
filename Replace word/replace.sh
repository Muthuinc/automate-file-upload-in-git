#! /bin/bash
set -e
filename=sample.txt
echo "From which line you want to find and replace a word. Enter the line number :"
read b 
echo "Enter the word to look in the line for script execution "
read e
echo "Enter the word you want to replace : "
read c
echo "Enter the word new word :"
read d

n=1
while read line;
do
  if  [ $n -ge $b ];
  then
     if ( grep -q -w "${e}" <<< "$line" ) then
      regex="^(.*)\b$e\b(.*)$"
      [[ "$line" =~ $regex ]]
       if [[ $? == 0 ]]
        then
         # echo "successful"
          # sed -i "s|${c}|$d|" sample.txt
          sed  -i "${n}s/${c}/$d/" $filename >> /dev/null 2>&1 
        #   cat sample.txt
           fi
     fi
   fi
 n=$(($n+1))
done < $filename













