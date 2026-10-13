#!/usr/bin/bash

interfaces=$(wg show interfaces)

if [ "$interfaces" ]; then
    printf '{ "text": "", "tooltip": "%s" }' "$interfaces"
fi
