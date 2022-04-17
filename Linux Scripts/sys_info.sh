#!/bin/bash

outfile=home/sysadmin/research/sys_info.txt
mkdir ~/research 2>/dev/null
echo "this is a quick script" > $outfile
echo 'My First Bash Script'
echo $(date)
date >> $outfile
echo >> $outfile
echo "Machine Type">> $outfile
echo $MACHTYPE >> $outfile
echo "uname details coming up..." >> $outfile
echo  -e "uname info: $(uname -a) \n" >> $outfile
#echo hostname -i | awk '{print $1}'
echo "my ip address is $('hostname' -I | awk '{print $1}' )" >> $outfile
echo "hostname info.." >> $outfile
echo "my hostname is $(hostname -s)"
echo "777 permission files" >> $outfile
find /home -type f -perm 777 >> $outfile
echo "top 10 processes" >> $outfile
ps aux | head | awk '{print $1,$2,$3}' >> $outfile
