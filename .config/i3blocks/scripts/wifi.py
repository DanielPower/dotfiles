#!/usr/bin/python
import os

wifi_network_stream = os.popen("iwctl station wlan0 show")

for line in wifi_network_stream.readlines():
    words = line.split()
    if len(words) >= 2 and words[0] == "State":
        state = words[1]
    if words[:2] == ["Connected", "network"]:
        network = words[2]

if state != "connected":
    print(state)
else:
    print(f"直 {network}")

