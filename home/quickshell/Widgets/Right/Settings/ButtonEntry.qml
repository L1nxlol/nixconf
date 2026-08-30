import Quickshell
import QtQuick
import "../../.." 
import "../../../Services"

Rectangle {
  property string eName: "name this"
  property bool recentlyClicked: false

  signal clickRequest()

  onRecentlyClickedChanged: if (recentlyClicked) recentlyClickedTimer.start()

  anchors {
    left: parent.left
    right: parent.right
  }

  height: 30
  anchors.leftMargin: 10
  anchors.rightMargin: 10
  
  color: Theme.light
  radius: 15

  Timer {
    id: recentlyClickedTimer
    interval: 1000
    repeat: false
    onTriggered: recentlyClicked = false
  }

  Text {
    font.family: Theme.font
    font.pixelSize: 20
    color: recentlyClicked ? Theme.accent : Theme.dark
    anchors.fill: parent 
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    text: eName
  }

  MouseArea {
    anchors.fill: parent
    anchors.rightMargin: -45
    onClicked: {
      if (recentlyClicked) {
        clickRequest()
      } else {
        recentlyClicked = true
      }
    }
  }
}
