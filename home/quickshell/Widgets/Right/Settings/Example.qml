import Quickshell
import QtQuick
import "../../.." 
import "../../../Services"

Item {
  property bool isToggled: false
  anchors {
    left: parent.left
    right: parent.right
  }
  height: 25
  anchors.leftMargin: 8
  anchors.rightMargin: 50
  
  Text {
    font.family: Theme.font
    font.pixelSize: 15
    color: Theme.light
    anchors.fill: parent 
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    text: "Test"
  }

  Switch {toggled: isToggled; anchors.rightMargin: -45}
  MouseArea {
    anchors.fill: parent
    onClicked: {
      isToggled = !isToggled
    }
    anchors.rightMargin: -45
  }
}
