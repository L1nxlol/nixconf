#!/usr/bin/env zsh
qs -p /home/user/Nix/home/quickshell/ ipc call screen-lock lock
sleep 0.6
grim -o "$(hyprctl monitors | awk '/Monitor/{mon=$2} /focused: yes/{print mon}')" "/tmp/lock.png"
hyprlock
qs -p /home/user/Nix/home/quickshell/ ipc call screen-lock unlock
