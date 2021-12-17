#!/usr/bin/python
import os

icons = {
    "Discharging": ["", "", "", "", "", "", "", "", "", "", "", ""],
    "Charging":    ["", "", "", "", "", "", "", "", "", "", "", ""],
}

battery_level_stream = os.popen('cat /sys/class/power_supply/BAT1/capacity')
battery_level_string = battery_level_stream.read().strip()
battery_level_int = int(battery_level_string)

battery_status = os.popen('cat /sys/class/power_supply/BAT1/status')
battery_status_string = battery_status.read().strip()

if battery_status_string == "Unknown":
    icon = ""
else:
    icon = icons[battery_status_string][battery_level_int // 10]

print(icon + " " + battery_level_string + "%")
