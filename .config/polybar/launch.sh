#!/usr/bin/env bash

# Create a gap so that the polybar does not overlap with windows
i3-msg gaps top all set 35

# Terminate already running bar instances
killall -q polybar

# Launch bar
echo "---" | tee -a /tmp/polybar.log
polybar main >> /tmp/polybar-maiin.log 2>&1 &
