#!/usr/bin/env python3

#Uses libraries python-rofi and pulsectl

from rofi import Rofi
import pulsectl, sys

def rofi_choose_pulse_device():
  pulse = pulsectl.Pulse()
  rofi = Rofi()

  sinks = pulse.sink_list()
  current_default_name = pulse.server_info().default_sink_name
  for i, s in enumerate(sinks):
    if s.name == current_default_name:
      current_default = i

  if current_default == None:
    print("Couldn't find the default sink?")
    return

  sink_index, _ = rofi.select("Select default sink", [s.description for s in sinks], select=current_default)
  if sink_index == -1:
    return

  pulse.default_set(sinks[sink_index])


if __name__ == '__main__':
    rofi_choose_pulse_device()
