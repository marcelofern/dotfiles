#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch bar
echo "---" | tee -a /tmp/polybar.log
polybar left >> /tmp/polybar-left.log 2>&1 &
polybar center >> /tmp/polybar-center.log 2>&1 &
polybar right >> /tmp/polybar-right.log 2>&1 &
