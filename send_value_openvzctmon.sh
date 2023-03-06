#!/bin/bash

DATA="/etc/zabbix/scripts/ct_param_value.dat"

param=$1
value=$2

cat /etc/zabbix/scripts/ct_param_value.dat | grep "^$param " | awk '{print $(var)}' var="${value}"
