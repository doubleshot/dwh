#!/bin/bash

KITCHEN=/usr/local/pentaho/pdi/kitchen.sh
ROOT_DIR=/opt/kaltura/dwh
TMP_DIR=/tmp

while getopts "k:p:" o
do      case "$o" in
    k)  KITCHEN="$OPTARG";;
    p)  ROOT_DIR="$OPTARG";;
        [?])    echo >&2 "Usage: $0 [-k  pdi-path] [-p dwh-path]"
                exit 1;;
        esac
done


mkdir -p $ROOT_DIR/etlsource/scripts/ip2location/`date +%b%y`
cd $ROOT_DIR/etlsource/scripts/ip2location/`date +%b%y`
perl $ROOT_DIR/etlsource/scripts/ip2location/download.pl -package DB7 -login alex.bandel@kaltura.com -password S47CW89L

unzip IP-COUNTRY-REGION-CITY-ISP-DOMAIN-FULL.ZIP

mv IP-COUNTRY-REGION-CITY-ISP-DOMAIN.CSV $TMP_DIR/IP-COUNTRY-REGION-CITY-ISP-DOMAIN.CSV

$KITCHEN -file $ROOT_DIR/etlsource/ip2location/load_ip2location.kjb
