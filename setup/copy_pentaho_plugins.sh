#!/bin/bash

KITCHEN=/usr/local/pentaho/pdi
ROOT_DIR=/opt/kaltura/dwh

while getopts "k:d:" o
do      case "$o" in
    	k)  KITCHEN="$OPTARG";;
    	d)  ROOT_DIR="$OPTARG";;
        [?])    echo >&2 "Usage: $0 [-k  pdi-path] [-d dwh-path]"
                exit 1;;
        esac
done

rsync -av --exclude=.svn $ROOT_DIR/pentaho-plugins/MySQLInserter32/MySQLInserter $KITCHEN/plugins/steps/
rsync -av --exclude=.svn $ROOT_DIR/pentaho-plugins/MappingFieldRunner32/MappingFieldRunner $KITCHEN/plugins/steps/
rsync -av --exclude=.svn $ROOT_DIR/pentaho-plugins/GetFTPFileNames32/GetFTPFileNames $KITCHEN/plugins/steps/
rsync -av --exclude=.svn $ROOT_DIR/pentaho-plugins/FetchFTPFile32/FetchFTPFile $KITCHEN/plugins/steps/
rsync -av --exclude=.svn $ROOT_DIR/pentaho-plugins/DimLookup32/DimLookup $KITCHEN/plugins/steps/
