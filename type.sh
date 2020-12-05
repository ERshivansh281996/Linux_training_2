#!/bin/bash
#Write a shell script of the form:
#typ <filespec>
#that displays whether the file(s) matching the filespec is/are:
#readable / writeable / executable
#file type (regular, directory, block special, character special, soft link)
#Filespec can be a wildcard.
#---------------------------------------------------------------------------------------------#
echo -n "Enter file name : "
read file

if [ -b $file ]
then
B="It is a Block special file"
elif [ -c $file ]
then
B="It is a Character special file"
elif [ -h $file ]
then
B="It is a Soft Link"
elif [ -f $file ]
then
B="It is a Regular file"
elif [ -d $file ]
then
B="It is a Directory file"
fi

[ -w $file ] && W="Write = yes" || W="Write = No" 

[ -x $file ] && X="Execute = yes" || X="Execute = No"

[ -r $file ] && R="Read = yes" || R="Read = No"
 
echo "$B"
echo "$file permissions"
echo "$W"
echo "$R"
echo "$X"
