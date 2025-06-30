#!/usr/bin/env bash

cd $HOME/.config/wezterm

highval=1.0
lowval=0.7

opacity=$(awk '/config.window_background_opacity/ {print $3}' wezterm.lua)

if [[ $opacity == $highval ]]; then
    sed -i "s/config.window_background_opacity *= *[0-9.]\+/config.window_background_opacity = $lowval/" wezterm.lua
elif [[ $opacity == $lowval ]]; then
    sed -i "s/config.window_background_opacity *= *[0-9.]\+/config.window_background_opacity = $highval/" wezterm.lua
else
    sed -i "s/config.window_background_opacity *= *[0-9.]\+/config.window_background_opacity = $highval/" wezterm.lua
fi
