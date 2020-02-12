#!/usr/bin/python
import os

icons = ["奄", "奔", "墳"]

volume_level_stream = os.popen('pamixer --get-volume')
volume_level = int(volume_level_stream.read().strip())

if volume_level == 0:
    icon = "奄"
elif volume_level < 50:
    icon = "奔"
else:
    icon = "墳"

if 'button' in os.environ:
    if os.environ['button'] == "1":
        os.system('$HOME/.scripts/rofi_choose_default_pulse_device.py')

print(icon + " " + str(volume_level) + "%")

