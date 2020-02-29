#!/usr/bin/env python3
from rofi import Rofi
import pulsectl, sys

def main():
  pulse = pulsectl.Pulse()
  rofi = Rofi()

  sinks = pulse.sink_list()
  current_default_name = pulse.server_info().default_sink_name
  for i, sink in enumerate(sinks):
    if sink.name == current_default_name:
      current_default = i

  if current_default == None:
    print("Couldn't find the default sink?")
    return

  sink_index, _ = rofi.select("Select default sink", [sink.description for sink in sinks], select=current_default)
  if sink_index == -1:
    return

  pulse.default_set(sinks[sink_index])


if __name__ == '__main__':
  main()
