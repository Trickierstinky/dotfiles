#!/bin/bash

i3status | while :
do
  read line
  nord="$(nordvpn status | grep -c Disconnected)"
  test='VPN off'
  if [ "$nord" -lt 1 ]
  then
    test="VPN On"
  fi

  echo "$test | $line" || exit 1
done
