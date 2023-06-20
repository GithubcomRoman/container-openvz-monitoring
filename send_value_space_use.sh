#!/bin/bash

DATA="/etc/zabbix/scripts/ct_space_use.dat"

param=$1
value=$2

cat $DATA | grep "$param " | awk '{print $(var)}' var="${value}"
