#!/bin/bash
#Составление списка контейнеров и их параметров

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

DATA="/etc/zabbix/scripts/ct_param_value.dat"

echo "" > $DATA

vz=`/usr/sbin/vzlist | awk '{print $1}' | grep -e "[[:digit:]]"`

for machine in $vz; do
	
	cpu_load_val=`vzctl exec $machine ps aux | awk '{s += $3} END {print s}'`
	mem_use_val=`vzctl exec2 $machine free -m | grep Mem | awk '{print $3}'`
	
	echo "$machine $cpu_load_val $mem_use_val" >> /etc/zabbix/scripts/ct_param_value.dat
	
done
