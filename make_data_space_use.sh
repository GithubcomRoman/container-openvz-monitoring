#!/bin/bash
#Make data for monitor disk space by each container

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

DATA="/etc/zabbix/scripts/ct_space_use.dat"
#TMP_DATA file used for collect data while script working,
#because it`s need some time
TMP_DATA="/tmp/ct_space_use.dat"
touch $TMP_DATA
#echo "" > $TMP_DATA

vz=`/usr/sbin/vzlist | awk '{print $1}' | grep -e "[[:digit:]]"`

for machine in $vz; do
	space_use_val=`du -shb /vz/private/$machine | awk '{print $1}'`
	echo -e "\nCount ${machine}: $space_use_val"
	echo "$machine $space_use_val" >> "${TMP_DATA}"

done

echo -e "\nALL DONE"
#echo "" > $DATA
mv $TMP_DATA $DATA
