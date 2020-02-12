#!/usr/bin/python
import os

icons = ["", "", "", "", "", "", ""]

backlight_level_stream = os.popen('xbacklight')
backlight_level = float(backlight_level_stream.read().strip())

icon = icons[int(6 * (backlight_level / 100))]
print(icon + " " + str(int(backlight_level)) + "%")

