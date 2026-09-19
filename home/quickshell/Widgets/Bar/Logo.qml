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
    id: icon
    font.family: Theme.iconFont
    font.pixelSize: 22         // 24px in a 24px box leaves no room to center
    color: Theme.highlight
    text: "󱄅"

    TextMetrics {
      id: tm
      font: icon.font
      text: icon.text
    }

    x: parent.width  / 2 - (tm.tightBoundingRect.x + tm.tightBoundingRect.width  / 2)
    y: parent.height / 2 - (icon.baselineOffset + tm.tightBoundingRect.y + tm.tightBoundingRect.height / 2)
  }
}
