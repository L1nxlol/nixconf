import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import "../.."
import "../../Services"

Rectangle {
  anchors.right: parent.right
  anchors.verticalCenter: parent.verticalCenter
  color: Theme.border
  radius: 20
  height: 24
  width: 100

  MouseArea {
    anchors.fill: parent
    onClicked: States.rightMenu = !States.rightMenu
  }
}
