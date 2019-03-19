#!/bin/bash

# this bash script is based on Aaron Lasseigne' blog post:
# https://aaronlasseigne.com/2012/10/15/battery-life-in-the-land-of-tmux/

HEART='♥'
PLUG='⚡'

if [[ `uname` == 'Darwin' ]]; then
  # TODO figure out not calling battery_info 3 times....
  battery_info=`ioreg -rc AppleSmartBattery`
  if [ -z "$battery_info" ]
  then
    # exit this script when there is no battery. (this is for my Mac Mini)
    exit 0
  else
    current_charge=$(echo $battery_info | grep -o '"CurrentCapacity" = [0-9]\+' | awk '{print $3}')
    total_charge=$(echo $battery_info | grep -o '"MaxCapacity" = [0-9]\+' | awk '{print $3}')
    external_connected=$(echo $battery_info | grep -o '"ExternalConnected" = [a-zA-Z]\+' | awk '{print $3}')
  fi
else
  # Script currently only works for MacOSX
  exit 0
fi


if [[ $external_connected == 'Yes' ]]; then
  echo -n "$PLUG "
fi

charged_slots=$(echo "(($current_charge/$total_charge)*10)+1" | bc -l | cut -d '.' -f 1)
if [[ $charged_slots -gt 10 ]]; then
  charged_slots=10
fi
echo -en "#[fg=red]"
for i in `seq 1 $charged_slots`; do echo -n "$HEART"; done

if [[ $charged_slots -lt 10 ]]; then
  echo -en "#[fg=white]"
  for i in `seq 1 $(echo "10-$charged_slots" | bc)`; do echo -n "$HEART"; done
fi

# Reset to white
echo -en "#[fg=white]"
