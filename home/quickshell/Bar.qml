import QtQuick
import Quickshell
import Quickshell.Wayland
import "Widgets/Static"

PanelWindow {
  anchors {
    top: true
    left: true
    right:true
  }
  property int thickness: 32

  WlrLayershell.layer: WlrLayer.Bottom
  exclusiveZone: thickness
  implicitHeight: thickness

  color: Theme.dark
  

  Workspaces {
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    // anchors.topMargin: 100
  }

  Clock {
    anchors.left: parent.left
    anchors.leftMargin: 10
    anchors.verticalCenter: parent.verticalCenter
  }
}
