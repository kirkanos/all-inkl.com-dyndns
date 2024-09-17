#!/bin/bash

source config

IP=$($CMD)
echo "-> Your IP is: ${IP}"
echo "-> Updating your DDNS ..."
output=$(curl -Ls "http://${USER}:${PASSWORD}@dyndns.kasserver.com/?myip=${IP}")
ret=$?
if [ ${ret} -eq 0 ]
then
  echo "-> DONE"
  echo OUTPUT: ${output}
  exit 0
else
  echo "-> Error"
  echo OUTPUT: ${output}
  exit 1
fi
