#!/bin/bash

for m in $(polybar --list-monitors | /usr/bin/cut -d":" -f1); do
    MONITOR=$m polybar main &
done
