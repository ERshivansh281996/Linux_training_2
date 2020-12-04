#!/bin/bash
#Write a shell script that checks when logging in, whether it is any of the known user's
#birthday today. Design and make use of a simple flat-file database "bday.dat" to store user information.
#-------------------------------------------------------------------------------------------------------------#
IFILE="$HOME/bday.csv"
OFILE=bday_out"$$
MAILID="guru@gmail.com"
DAT='date '+%d %b''
DAY=${DAT:0:2}
MON=echo ${DAT:3:3} | awk '{print toupper($0);}''
while IFS=",-" read name day month year
do
day= 'printf "%02d\n" $day
month= 'echo $month |awk '{print toupper($0);}''
if [$day -eq $DAY -a $month = $MON]
then
echo $name
fi
done < $IFILE > $OFILE

if [ -f $OFILE -a -s $OFILE]
then
sed -i '1i The following user celebrate their bday:\n' $OFILE
mailx -s "bday on: $DAT" $MAILID < $OFILE
/rm $OFILE
echo "Bday mail sent"
else
echo "No Bday mail sent"
fi




