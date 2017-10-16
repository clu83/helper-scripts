#!/bin/zsh
LAST_FULL_CAP=$(cat /sys/class/power_supply/BAT0/charge_full)

REMAINING_CAP=$(cat /sys/class/power_supply/BAT0/charge_now)

BATTERY_CHARGING=$(cat /sys/class/power_supply/BAT0/status)

BATTERY_PERCENT=$(echo "scale=4;((($REMAINING_CAP*1.0)/($LAST_FULL_CAP*1.0)))" | bc)
BATTERY_PERCENT=$(echo "$BATTERY_PERCENT*100" | bc | egrep -o '[[:digit:]]{1,3}\.[[:digit:]]{2}')


if [[ "${BATTERY_CHARGING}" == "Charging" ]]; then
    PR_BATTERY+="%B%F{yellow}⚡"

elif [[ "${BATTERY_CHARGING}" == "Discharging" ]]; then
    PR_BATTERY+="%B%F{blue}⚡"
else
   PR_BATTERY+="%B%F{green}⚡"

fi
if [[ $BATTERY_PERCENT -lt 15 ]]; then
    PR_BATTERY+="%B%F{red}$BATTERY_PERCENT"
elif [[ $BATTERY_PERCENT -lt 50 ]]; then
    PR_BATTERY+="%B%F{yellow}$BATTERY_PERCENT"
else
    PR_BATTERY+="%B%F{green}$BATTERY_PERCENT"
fi

PR_BATTERY+="%%%f%b @"

printf "%s" $PR_BATTERY
