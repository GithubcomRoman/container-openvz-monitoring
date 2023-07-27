# container-openvz-monitoring

crontab 
* * * * * /etc/zabbix/scripts/./make_data_openvzctmon.sh
* */1 * * * /etc/zabbix/scripts/./make_data_space_use.sh
