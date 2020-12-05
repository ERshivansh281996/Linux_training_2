 #!/bin/bash
#Write a shell script that prints the total space used by a specified directory (and all it's
#files & sub-directories) in bytes, kilobytes and megabytes. It should be of the form:
#$ total <start_directory>
#...
#<start_directory>:b:k:m
#$
#(bytes:Kb:Mb)
#--------------------------------------------------------------------------------------------------------------#

 dir=$1
 ls -l $dir | awk 'NR ==1'
 awk 'BEGIN { print "Name                      Bytes           Kbytes          Mbytes"}'
 ls -l $dir | awk '{printf "%-20s \t  %-5s \t  %-6s \t  %-6s\n", $9, $5, $5/1000, $5/1000000}' | awk 'NR > 1'
