#!/bin/bash
DIR=`pwd`
cd /home/jose/puppet-project
git add *
git commit -m 'automatic'
git push
ssh -t root@192.168.122.2 'cd /usr/share/puppet/puppet-project; git pull'
cd $DIR
