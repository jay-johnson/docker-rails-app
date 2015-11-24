#!/bin/bash

log="/tmp/runtests.log"

source /opt/actionhooks/docker_config.sh .

curdate=`/bin/date`

echo "" > $log
echo "Latest Run Tests Event $curdate" >> $log
echo "" >> $log



# Custom Actions for the type of application:
pushd /opt/webapp >> $log

bundle exec rake test TEST=test/controllers/hello_world_test.rb

popd >> $log



curdate=`/bin/date`

echo "" >> $log
echo "END of Run Tests Event $curdate" >> $log
echo "" >> $log

exit 0

