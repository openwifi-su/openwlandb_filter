#!/bin/bash
set +ue
set -x
wget -O"db.tar.bz2" http://www.openwifi.su/db/db.tar.bz2
bunzip2 -c db.tar.bz2 > db.tar
tar xvf db.tar
MD5=`md5sum db/db.csv`
DAY=`date +%Y-%m-%d`
mv db/db.csv db/db${MD5}.csv
echo $MD5 >  last_update_md5
mv db.tar.bz2 db.${DAY}.tar.gz
rm -fy db.tar
#delemter chr(09) - tab
