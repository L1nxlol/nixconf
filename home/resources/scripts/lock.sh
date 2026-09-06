#!/usr/bin/env zsh
qs -p /home/user/Nix/home/quickshell/ ipc call screen-lock lock
sleep 0.54
grim "/tmp/lock.png"
hyprlock
