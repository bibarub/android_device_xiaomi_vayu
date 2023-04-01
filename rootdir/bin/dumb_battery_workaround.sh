#!/system/bin/sh
nodepath=/sys/class/power_supply/battery
dumpsys battery set usb 0
while true; do
sleep 1
if [[ $(< $nodepath/status) != "Discharging" ]]; then
dumpsys battery set ac 1
else
dumpsys battery set ac 0
fi
dumpsys battery set level $(cat $nodepath/capacity)
dumpsys battery set temp $(cat $nodepath/temp)
dumpsys battery set counter $(cat $nodepath/charge_counter)
done
