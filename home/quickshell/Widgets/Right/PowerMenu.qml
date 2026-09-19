import QtQuick
import Quickshell

Row {
  id: root
  height: 50
  width: 270
  spacing: 5

  PowerButton {
    icon: "󰍁"
    iconSize: 45
    onActivated: Quickshell.execDetached(["hyprlock"])
  }

  PowerButton {
    icon: "󰍃"
    iconSize: 50
    iconOffsetX: 7
    onActivated: Quickshell.execDetached(["hyprshutdown"])
  }

  PowerButton {
    icon: "󰑏"
    iconSize: 45
    iconOffsetY: 2
    onActivated: Quickshell.execDetached(["systemctl", "soft-reboot"])
  }

  PowerButton {
    icon: ""
    iconSize: 46
    onActivated: Quickshell.execDetached(["reboot"])
  }

  PowerButton {
    icon: ""
    iconSize: 46
    onActivated: Quickshell.execDetached(["poweroff"])
  }
}
