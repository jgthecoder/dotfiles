#!/bin/sh

# Variables
LOG_FILE="$HOME/Logs/battery_log.txt"

# Get battery percentage and status
BATTERY_PERCENT=$(pmset -g batt | grep -o "[0-9]\+%")
BATTERY_STATUS=$(pmset -g batt | grep -o "charging\|discharging")

# Log the data
echo "$(date +"%Y-%m-%d %H:%M:%S") - Battery: $BATTERY_PERCENT, Status: $BATTERY_STATUS" >> "$LOG_FILE"

echo "Battery status logged to $LOG_FILE"
