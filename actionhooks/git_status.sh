#!/bin/bash

log="/tmp/gitstatuscheck.log"

curdate=`/bin/date`

echo "" > $log
echo "Getting repo status: $curdate" >> $log
echo "" >> $log
pushd /opt/webapp >> /dev/null

echo "git status:" 
git status 
echo "" 
echo "git log:" 
git log -1
echo "" 
echo "Done" 

popd >> /dev/null

echo "" >> $log
echo "Done Getting repo status" >> $log
echo "" >> $log

exit 0

