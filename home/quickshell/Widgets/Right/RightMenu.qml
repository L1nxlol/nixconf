import QtQuick
import Quickshell
import "../.."
import "../../Bar"
import "../../Services"

Loader {
  active: States.rightMenu || closeTimer.running

  Timer {
    id: closeTimer
    interval: 400 
    onTriggered: {} 
  }

  onLoaded: {} 

  Connections {
    target: States
    function onRightMenuChanged() {
      if (!States.rightMenu) closeTimer.start()
    }
  }

  sourceComponent: Column {
    spacing: 15
    height: 1200
    width: 300

    PowerMenu {}

    Rectangle {
      height: 970
      width: 270
      color: Theme.border
      radius: 20

      Rectangle {
        height: 30
        width: 90
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        topLeftRadius: 20
        topRightRadius: 20
        color: {
          if (States.rightMenuState === 2) return Theme.accent 
          else return Theme.border
        }

        MouseArea {
          anchors.fill: parent
          onClicked: States.rightMenuState = 2
        }
      }

      Rectangle {
        height: 30
        width: 90
        anchors.top: parent.top
        anchors.left: parent.left
        topLeftRadius: 20
        topRightRadius: 20
        color: {
          if (States.rightMenuState === 1) return Theme.accent 
          else return Theme.border
        }

        MouseArea {
          anchors.fill: parent
          onClicked: States.rightMenuState = 1
        }
      }

      Rectangle {
        height: 30
        width: 90
        anchors.top: parent.top
        anchors.right: parent.right
        topLeftRadius: 20
        topRightRadius: 20
        color: {
          if (States.rightMenuState === 3) return Theme.accent 
          else return Theme.border
        }

        MouseArea {
          anchors.fill: parent
          onClicked: States.rightMenuState = 3
        }
      }

      Item {
        anchors.fill: parent
        anchors.topMargin: 38
        anchors.bottomMargin: 8
        anchors.leftMargin: 8
        anchors.rightMargin: 8

        Loader{
          active: States.rightMenuState === 1
          anchors.fill: parent
          sourceComponent: Rectangle {
            anchors.fill: parent
            color: Theme.light
          }
        }

        Loader{
          active: States.rightMenuState === 2
          anchors.fill: parent
          sourceComponent: Rectangle {
            anchors.fill: parent
            color: Theme.accent
          }
        }

        Loader{
          active: States.rightMenuState === 3
          anchors.fill: parent
          sourceComponent: BluetoothMenu {anchors.fill: parent}
        }
      }
    }
  }
}
