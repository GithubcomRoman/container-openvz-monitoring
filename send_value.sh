#!/bin/bash

DATA="/etc/zabbix/scripts/ct_param_value.txt"

param=$1
value=$2

cat /etc/zabbix/scripts/ct_param_value.txt | grep "$param " | awk '{print $(var)}' var="${value}"