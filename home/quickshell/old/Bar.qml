import QtQuick
import Quickshell
import Quickshell.Wayland
import "Widgets/Static"

PanelWindow {

  implicitHeight: 32
  color: "transparent"
  anchors {
    top: true
    left: true
    right:true
  }

Rectangle {

  implicitHeight: 32
  color: Theme.dark
  anchors.fill: parent

  // Workspaces {
  //   anchors.horizontalCenter: parent.horizontalCenter
  //   anchors.verticalCenter: parent.verticalCenter
  // }

  Clock {
    anchors.left: parent.left
    anchors.leftMargin: 10
    anchors.verticalCenter: parent.verticalCenter
  }
}
}
