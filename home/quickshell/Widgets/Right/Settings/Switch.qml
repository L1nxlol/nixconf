import Quickshell
import QtQuick
import "../../.." 
import "../../../Services"

Rectangle {
  required  property bool toggled
  
  height: 23
  width: 40
  radius: 20
  anchors.verticalCenter: parent.verticalCenter
  anchors.right: parent.right
  border.color: Theme.border
  border.width: 3
  
  color: toggled ? Theme.light : Theme.gray

  Rectangle {
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    anchors.leftMargin: toggled ? 22 : 6 
    height: 12
    width: 12
    radius: 20
    color: Theme.dark

    Behavior on anchors.leftMargin {
      SpringAnimation { spring: 10; damping: 1}
    }
  }
}
