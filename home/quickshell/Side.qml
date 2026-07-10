import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
  property string side: "left"
  property int thickness: 10

  anchors {
    bottom: true
    left: side !== "right"
    right: side !== "left"
    top: side !== "bottom"
  }

  WlrLayershell.layer: WlrLayer.Bottom
  exclusiveZone: thickness
  implicitHeight: thickness
  implicitWidth: thickness

  color: Theme.dark
}
