#!/bin/bash

DATA="/etc/zabbix/scripts/ct_param_value.txt"


JSON=$(for i in `cat $DATA | awk '{print $1}' `; do printf "{\"{#CT_ID}\":\"$i\"},"; done | sed 's/^\(.*\).$/\1/')
printf "{\"data\":["
printf "$JSON"
printf "]}"