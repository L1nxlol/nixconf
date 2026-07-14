import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import "../.."

Rectangle {
  property var screen

  width: workspaceList.contentWidth + 10
  anchors.centerIn: parent
  color: Theme.border
  height: 24
  radius: 20

  ListView {
    id: workspaceList
    orientation: ListView.Horizontal
    interactive: false
    anchors.fill: parent
    spacing: 3
    anchors.leftMargin: 5

    model: ScriptModel {
      values: Hyprland.workspaces.values.filter(ws => ws.monitor.name === screen.name && ws.id > 0)
    }

    delegate: Workspace {}
  }
}
