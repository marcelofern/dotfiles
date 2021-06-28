#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

i3-msg gaps top all set 25
