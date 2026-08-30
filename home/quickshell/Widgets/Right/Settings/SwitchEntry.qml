import Quickshell
import QtQuick
import "../../.." 
import "../../../Services"

Item {
  property string eName: "name this"
  property bool isToggled: false

  signal toggleRequest()

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
    text: eName
  }

  Switch {toggled: isToggled; anchors.rightMargin: -45}

  MouseArea {
    anchors.fill: parent
    anchors.rightMargin: -45
    onClicked: toggleRequest()
  }
}
