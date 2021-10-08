#!/bin/bash

# This script will count the number of unique ISO downloads from a server

# combine both logs into one file
cat cdlinux.www.log > both.log # concatenate cdlinux.www.log to both.log
cat cdlinux.ftp.log >> both.log # concatenate and append cdlinux.ftp.log to both.log

# grep the created file for the '.iso'
# pipe output from grep to grep to find the IP addresses
# pipe output from grep to uniq to find unique occurances of IP addresses
# pipe output from uniq to wc to find the line count of unique IP addresses
grep -iE '\.iso' both.log | grep -iE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | uniq | wc -l
