#!/usr/bin/python
import os

battery_level_stream = os.popen('cat /sys/class/power_supply/BAT0/capacity')
battery_level_string = battery_level_stream.read().strip()
battery_level_int = int(battery_level_string)

battery_status = os.popen('cat /sys/class/power_supply/BAT0/status')
battery_status_string = battery_status.read().strip()

icons = {
    "Discharging": ["", "", "", "", "", "", "", "", "", "", "", ""],
    "Charging":    ["", "", "", "", "", "", "", "", "", "", "", ""],
}

if battery_status_string == "Unknown":
    icon = ""
else:
    icon = icons[battery_status_string][battery_level_int // 10]

print(icon + " " + battery_level_string + "%")
