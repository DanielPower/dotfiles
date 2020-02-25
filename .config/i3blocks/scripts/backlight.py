#!/usr/bin/python
import os

icons = ["", "", "", "", "", "", ""]

backlight_level_stream = os.popen('xbacklight')
backlight_level = float(backlight_level_stream.read().strip())

if "button" in os.environ:
    if os.environ["button"] == "4":
        os.system("xbacklight -inc 5")
        backlight_level = min(backlight_level + 5, 100)
    elif os.environ["button"] == "5":
        os.system("xbacklight -dec 5")
        backlight_level = max(backlight_level - 5, 0)

icon = icons[int(6 * (backlight_level / 100))]
print(icon + " " + str(int(backlight_level)) + "%")

