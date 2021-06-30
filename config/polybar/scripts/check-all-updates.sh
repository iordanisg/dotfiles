#!/bin/sh
#source https://github.com/x70b1/polybar-scripts


if ! updates_arch_aur=$(checkupdates+aur 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if [ "$updates_arch_aur" -gt 0 ]; then
    echo " $updates_arch_aur"
else
    echo "0"
fi
