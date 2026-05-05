#!/bin/ash
cp /usr/share/zoneinfo/$TZ /etc/timezone
echo $TZ > /etc/timezone
echo "Current date is $(date)."
echo "Files being backed up mount are:"
ls -l /data_to_backup/
echo "Starting ofelia. (crond replacement)"
ofelia daemon --config=/ofelia_config.ini
