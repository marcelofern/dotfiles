#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch bar
echo "---" | tee -a /tmp/polybar.log
polybar example >> /tmp/polybar.log 2>&1 &
echo "Bars launched ..."
