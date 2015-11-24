#!/bin/bash

log="/tmp/pullandrestart.log"

curdate=`/bin/date`

echo "" > $log
echo "Pull and Restart Event: $curdate" >> $log
echo "" >> $log
pushd /opt/webapp >> /dev/null

targettag=""

echo "Checking out master" 
git checkout master >> $log
echo "Fetching all" 
git fetch --all >> $log
echo "Pulling on master" 
git pull >> $log
echo "Checking Branch(master)" 
git checkout master >> $log
echo "Pull Branch(master)" 
git pull >> $log
echo "Done" 

popd >> /dev/null

echo "" >> $log
echo "Done Deploying" >> $log
echo "" >> $log

exit 0

