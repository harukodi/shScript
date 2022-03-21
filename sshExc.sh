#!/bin/bash

for i in {1..5}
do
   ssh root@192.168.1.${i} 'bash -s' < ./sshExc.sh ; done
done