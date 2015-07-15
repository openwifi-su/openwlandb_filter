#!/bin/bash
set +ue
set -x
mailme()
{
  echo "message: $1" | mail -s "sxgeo" mail@mail.su
}

cd /mnt/sdc1/openwlandb_filter
wget -O- -q -S --spider http://www.openwifi.su/db/db.tar.bz2  2>tmp
CUR_ETAG=`cat tmp | grep "ETag" | awk -F'"' '{ print $2 }'`
echo $CUR_ETAG
rm -f tmp

PREV_ETAG=`cat last_etag`
echo $PREV_ETAG
if [ $CUR_ETAG == $PREV_ETAG ];
then
    echo "Need NOT update"
    exit 0
else
    echo "Need update"
    echo $CUR_ETAG > last_etag
fi
