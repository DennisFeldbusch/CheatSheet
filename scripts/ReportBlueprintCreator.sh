#!/bin/bash

# Title:  ReportCreator
# Author: S0teri
# Date:   08.04.2021

while getopts n:h: flag

do
	case "${flag}" in
		n) name=${OPTARG};;
	esac
done

cat << "EOF"

  _____                       _    _____                _             
 |  __ \                     | |  / ____|              | |            
 | |__) |___ _ __   ___  _ __| |_| |     _ __ ___  __ _| |_ ___  _ __ 
 |  _  // _ \ '_ \ / _ \| '__| __| |    | '__/ _ \/ _` | __/ _ \| '__|
 | | \ \  __/ |_) | (_) | |  | |_| |____| | |  __/ (_| | || (_) | |   
 |_|  \_\___| .__/ \___/|_|   \__|\_____|_|  \___|\__,_|\__\___/|_|   
            | |                                                       
	    |_|		   _____  ___  _            _ 
			  / ____|/ _ \| |          (_)
			 | (___ | | | | |_ ___ _ __ _ 
			  \___ \| | | | __/ _ \ '__| |
			  ____) | |_| | ||  __/ |  | |
		by	 |_____/ \___/ \__\___|_|  |_|
EOF

echo 'Creating report for:' $name ...

TEXT=$'# Report \n
\n
## Target: $name \n
\n
## Domains \n
\n
### Subdomains \n
\n
## Open Ports \n
\n
## Interesting \n
\n 
## Found \n
\n
'

echo "$TEXT" > Report.txt

echo 'Done'
