#!/usr/bin/bash

profile=$(asusctl profile get | awk '/Active profile/ {print $3}')

case "$profile" in
Quiet)
    echo "󰌪"
    ;;
Balanced)
    echo "󰾆"
    ;;
Performance)
    echo "󰓅"
    ;;
esac
