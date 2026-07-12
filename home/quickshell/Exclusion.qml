import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
  property string side: ""
  property int thickness: 7

  anchors {
    bottom: side !== "top"
    left: side !== "right"
    right: side !== "left"
    top: side !== "bottom"
  }

  WlrLayershell.layer: WlrLayer.Bottom
  exclusiveZone: thickness
  implicitHeight: thickness
  implicitWidth: thickness

  color: "transparent"
}
