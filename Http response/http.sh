#! /bin/bash
set -e

#My tutor gave me another task informed us to ignore  this http error task. I raised a query in zenportal. few days ago they responded to do this task also. so dont reduce marks for the delayed task uploading. It was due to confusion between mentor and guvi people and delayed communication.

# Asking the user the enter the website to check 

echo "Enter the url to check the response "

#Storing the value in the variable

read a 

#Fetching the http error code in a variable 

b=$(curl -I -s http://$a | grep HTTP )

#Saving the error code in a text file

echo $b > test1.txt

#Cutting only the error response for Eg:"400 Bad Request" and save it in a variable

k=$(cut -c 9- test1.txt)

#Creating an array to store the various types of common or available error codes 

numarray=("401 Unauthorized" "400 Bad Request" "301 Moved Permanently" "403 Forbidden")

# The below array is our response 
mumarray=("the resource has not been authenticated" "invalid syntax" "The resource has permanently moved to a new URL try 'curl -I $a and look for url'" "The server understands the client but denies access to the requested resource")
#Getting the length of the array in a variable. we can use it to loop through it to check for the erro code matching.

c=${#numarray[@]}

#While loop will till we find the matching error codes availabe in the array
i=0
while [ $i -le $c ];
do

#The variable j stores the corresponding value of the array when we loop through the array. 
j=${numarray[$i]}
 #Comparing the strings
if [[ "$k" =~ "$j" ]];
then
echo  ${numarray[$i]}  ${mumarray[$i]} 
fi
i=$(($i+1))
done
sleep 2

# the created file for this is now removed
rm test1.txt



