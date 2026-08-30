import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import "../.."
import "../../Services"

Rectangle {
  anchors.left: parent.left
  anchors.verticalCenter: parent.verticalCenter
  color: Theme.border
  radius: 20
  height: 24
  width: 24

  MouseArea {
    anchors.fill: parent
    onClicked: States.leftMenu = !States.leftMenu
  }

  Text {
    font.family: Theme.font
    font.pixelSize: 30
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    color: Theme.highlight
    anchors.fill: parent 
    text: "󱄅"
  }
}
