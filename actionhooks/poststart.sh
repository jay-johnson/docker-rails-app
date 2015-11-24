#!/bin/bash

log="/tmp/poststart.log"

source /opt/actionhooks/docker_config.sh .

curdate=`/bin/date`

echo "" > $log
echo "Latest Post-Start Event $curdate" >> $log
echo "" >> $log



# Custom Actions for the type of application:
pushd /opt/webapp >> $log

popd >> $log



curdate=`/bin/date`

echo "" >> $log
echo "END of Post-Start Event $curdate" >> $log
echo "" >> $log

exit 0

