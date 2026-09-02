import QtQuick
import Quickshell
import "../.."
import "../../Bar"
import "../../Services"

Row {
  id: powerMenuRoot
  height: 50
  width: 270
  spacing: 5

  Rectangle {
    id: lockButton
    property bool recentlyClicked: false

    height: 50
    width: 50
    radius: 5
    color: recentlyClicked ? Theme.accent : Theme.light
    
    onRecentlyClickedChanged: if (recentlyClicked) recentlyClickedTimer1.start()

    Timer {
      id: recentlyClickedTimer1
      interval: 1000
      repeat: false
      onTriggered: lockButton.recentlyClicked = false
    }

    Text {
      font.family: Theme.font
      font.pixelSize: 45
      color: Theme.border
      anchors.fill: parent 
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      text: "󰍁"
    }

    MouseArea {
      anchors.fill: parent
      onClicked: lockButton.recentlyClicked ? Quickshell.execDetached(["hyprlock"]) : lockButton.recentlyClicked = true
    }
  }

  Rectangle {
    id: logoutButton
    property bool recentlyClicked: false

    height: 50
    width: 50
    radius: 5
    color: recentlyClicked ? Theme.accent : Theme.light
    
    onRecentlyClickedChanged: if (recentlyClicked) recentlyClickedTimer2.start()

    Timer {
      id: recentlyClickedTimer2
      interval: 1000
      repeat: false
      onTriggered: logoutButton.recentlyClicked = false
    }

    Text {
      font.family: Theme.font
      font.pixelSize: 50
      color: Theme.border
      anchors.fill: parent 
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      anchors.leftMargin: 7
      text: "󰍃"
    }

    MouseArea {
      anchors.fill: parent
      onClicked: logoutButton.recentlyClicked ? Quickshell.execDetached(["hyprshutdown"]) : logoutButton.recentlyClicked = true
    }
  }


  Rectangle {
    id: srestartButton
    property bool recentlyClicked: false

    height: 50
    width: 50
    radius: 5
    color: recentlyClicked ? Theme.accent : Theme.light
    
    onRecentlyClickedChanged: if (recentlyClicked) recentlyClickedTimer3.start()

    Timer {
      id: recentlyClickedTimer3
      interval: 1000
      repeat: false
      onTriggered: srestartButton.recentlyClicked = false
    }

    Text {
      font.family: Theme.font
      font.pixelSize: 45
      color: Theme.border
      anchors.fill: parent 
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      anchors.bottomMargin: 2
      text: "󰑏"
    }

    MouseArea {
      anchors.fill: parent
      onClicked: srestartButton.recentlyClicked ? Quickshell.execDetached(["systemctl", "soft-reboot"]) : srestartButton.recentlyClicked = true
    }
  }


  Rectangle {
    id: restartButton
    property bool recentlyClicked: false

    height: 50
    width: 50
    radius: 5
    color: recentlyClicked ? Theme.accent : Theme.light
    
    onRecentlyClickedChanged: if (recentlyClicked) recentlyClickedTimer4.start()

    Timer {
      id: recentlyClickedTimer4
      interval: 1000
      repeat: false
      onTriggered: restartButton.recentlyClicked = false
    }

    Text {
      font.family: Theme.font
      font.pixelSize: 50
      color: Theme.border
      anchors.fill: parent 
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      text: ""
    }

    MouseArea {
      anchors.fill: parent
      onClicked: restartButton.recentlyClicked ? Quickshell.execDetached(["reboot"]) : restartButton.recentlyClicked = true
    }
  }


  Rectangle {
    id: powerButton
    property bool recentlyClicked: false

    height: 50
    width: 50
    radius: 5
    color: recentlyClicked ? Theme.accent : Theme.light
    
    onRecentlyClickedChanged: if (recentlyClicked) recentlyClickedTimer5.start()

    Timer {
      id: recentlyClickedTimer5
      interval: 1000
      repeat: false
      onTriggered: powerButton.recentlyClicked = false
    }

    Text {
      font.family: Theme.font
      font.pixelSize: 50
      color: Theme.border
      anchors.fill: parent 
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      text: ""
    }

    MouseArea {
      anchors.fill: parent
      onClicked: powerButton.recentlyClicked ? Quickshell.execDetached(["poweroff"]) : powerButton.recentlyClicked = true
    }
  }
}
 
