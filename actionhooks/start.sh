#!/bin/bash

log="/tmp/start.log"

source /opt/actionhooks/docker_config.sh .

curdate=`/bin/date`

echo "" > $log
echo "Latest Start Event $curdate" >> $log
echo "" >> $log



# Custom Actions for the type of application:
pushd /opt/webapp >> $log

bundle exec rails server -b 0.0.0.0 &> $log 

popd >> $log



curdate=`/bin/date`

echo "" >> $log
echo "END of Start Event $curdate" >> $log
echo "" >> $log

# Tail to keep the foreground process active.
tail -f /tmp/start.log


