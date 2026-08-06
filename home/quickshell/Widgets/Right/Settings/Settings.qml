import Quickshell
import QtQuick
import "../../.." 
import "../../../Services"

Rectangle{
  anchors.fill: parent
  anchors.leftMargin: 4
  anchors.rightMargin: 4
  anchors.topMargin: 4
  anchors.bottomMargin: 4
  radius: 20
  color: Theme.dark
  
  Column {
    anchors.topMargin: 10
    spacing: 5
    anchors.fill: parent
    Example {}
    Example {}
    Example {}
    // hot corners
    // dnd
    //
  }
}
