#!/bin/bash

#### List of DB Dumps ####

ls -1 /exportqgu/CATT >> /u01/app/oracle/filename.csv

cat <<EOT >> /u01/app/oracle/load1.ctl
LOAD DATA
INFILE '/u01/app/oracle/filename.csv'

TRUNCATE
INTO TABLE DSS_CONFIGURATION_DATA
fields terminated by ","
(
   CONFIGDATA_VALUE
)
EOT

sqlldr userid=<user>/<pass>  control='/u01/app/oracle/load1.ctl'
rm -rf /u01/app/oracle/load1.ctl


#### List of Software Branches ####
svn ls https://svn.internal.company.eu:18080/svn/ --verbose >> repos.txt

while IFS= read -r line; do
    svn ls https://svn.internal.company.eu:18080/svn/$line/branches/ --verbose | awk '{print $6}' >> /u01/app/oracle/branches.csv
done < "repos.txt"

cat <<EOT >> /u01/app/oracle/load1.ctl
LOAD DATA
INFILE '/u01/app/oracle/branches.csv'

TRUNCATE
INTO TABLE DSS_CONFIGURATION_DATA
fields terminated by ","
(
   CONFIGDATA_VALUE
)
EOT

sqlldr userid=<user>/<pass>  control='/u01/app/oracle/load1.ctl'
rm -rf /u01/app/oracle/load1.ctl
