#!/bin/sh
export KSROOT=/jffs/koolshare
source $KSROOT/scripts/base.sh

i=120
until [ -n "$PERP" ]
PERP=`pidof perpd`
do
    i=$(($i-1))
    if [ "$i" -lt 1 ];then
        exit
    fi
    sleep 1
    echo $i
done

sleep 3

run_time=`perpls skipd|awk '{print $6}'|cut -d "s" -f1`

if [ "$run_time" -lt "20" ];then
	http_response "1"
else
	http_response "0"
fi