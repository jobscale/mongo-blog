#!/bin/bash -eu

export DB_HOST=172.16.6.22
export DB_PORT=27017

check() {
  nc $DB_HOST $DB_PORT -w 1 < /dev/null
  if [ $? -eq 0 ]
  then
    echo -e "\nOK!"
    return 0
  fi
  return 1
}

waiter() {
  while true
  do
    check
    if [ $? -eq 0 ]
    then
      break
    fi
    sleep 60
  done
}
waiter

. /home/jobscale/.nvm/nvm.sh
cd /var/site/projects/node/N-blog
PORT=3344 npm start
