import QtQuick
import Quickshell

Row {
  id: root
  height: 50
  width: 270
  spacing: 5

  PowerButton {
    icon: "󰍁"
    iconSize: 35
    onActivated: Quickshell.execDetached(["hyprlock"])
  }

  PowerButton {
    icon: "󰍃"
    iconSize: 30
    iconOffsetX: 7
    onActivated: Quickshell.execDetached(["hyprshutdown"])
  }

  PowerButton {
    icon: "󰑏"
    iconSize: 30
    iconOffsetY: 2
    onActivated: Quickshell.execDetached(["systemctl", "soft-reboot"])
  }

  PowerButton {
    icon: ""
    iconSize: 28
    onActivated: Quickshell.execDetached(["reboot"])
  }

  PowerButton {
    icon: ""
    iconSize: 29
    onActivated: Quickshell.execDetached(["poweroff"])
  }
}
