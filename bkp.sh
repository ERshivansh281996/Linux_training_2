#!/bin/bash
#Write a simple backup script; it should work like this:
#bkp [--restore] <src_dir> <dest_dir>
#It should recursively tar and compress all files under <src_dir> and store the resulting compressed .tar.xz file in <dest_dir>
#If the --restore option is passed (as first parameter), then the third parameter is the location of the
#.tar.xz backup file, and you should restore it’s content into the <src_dir> (second parameter)
#specified. (Be careful! test in a local ~/tmp directory only at first and as non-root).
#---------------------------------------------------------------------------------------------------------------------------------#
if [ $1 == "--restore" ]
 then 
 echo "--restoreed"
 tar -xf $3/*bkup* -C $2
else
	FILE=$2/bkup.tar.xz
	tar -cjf bkup.tar.xz $1
	if [ -f "$FILE" ]
	then
	echo "$FILE exists."
	mv $2/bkup.tar.xz $2/bkup.tar.xz.bkp;
	else
	echo "new file created"
	mv bkup.tar.xz $2;
	fi
fi
