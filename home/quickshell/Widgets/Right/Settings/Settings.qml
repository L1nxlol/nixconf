import Quickshell
import QtQuick
import "../../.." 
import "../../../Services"

Rectangle{
    property bool test: false
  anchors.fill: parent
  anchors.leftMargin: 4
  anchors.rightMargin: 4
  anchors.topMargin: 4
  anchors.bottomMargin: 4
  radius: 20
  color: Theme.dark
  
  Column {
    spacing: 10
    anchors.fill: parent
    Switch {toggled: test}
    MouseArea {
      anchors.fill: parent
      onClicked: test = !test
    }
  }
}
