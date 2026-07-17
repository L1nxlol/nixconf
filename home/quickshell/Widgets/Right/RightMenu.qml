import QtQuick
import Quickshell
import "../.."
import "../../Bar"
import "../../Services"
import "Settings"

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
        color: Theme.border

        MouseArea {
          anchors.fill: parent
          onClicked: States.rightMenuState = 2
        }

        Text {
          font.family: Theme.font
          font.pixelSize: 15
          color: Theme.accent
          anchors.fill: parent 
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          text: "Wifi"
        }
      }

      Rectangle {
        height: 30
        width: 90
        anchors.top: parent.top
        anchors.left: parent.left
        topLeftRadius: 20
        topRightRadius: 20
        color: Theme.border

        MouseArea {
          anchors.fill: parent
          onClicked: States.rightMenuState = 1
        }

        Text {
          font.family: Theme.font
          font.pixelSize: 15
          color: Theme.accent
          anchors.fill: parent 
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          text: "Settings"
        }
      }

      Rectangle {
        height: 30
        width: 90
        anchors.top: parent.top
        anchors.right: parent.right
        topLeftRadius: 20
        topRightRadius: 20
        color: Theme.border

        MouseArea {
          anchors.fill: parent
          onClicked: States.rightMenuState = 3
        }

        Text {
          font.family: Theme.font
          font.pixelSize: 15
          color: Theme.accent
          anchors.fill: parent 
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          text: "Bluetooth"
        }
      }

      Rectangle {
        height: 30
        width: 90
        anchors.top: parent.top
        anchors.left: parent.left
        topLeftRadius: 20
        topRightRadius: 20
        color: Theme.accent

        anchors.leftMargin: {
          if (States.rightMenuState === 1) return 0
          else if (States.rightMenuState === 2) return 90
          else return 180
        }

        Text{
          font.family: Theme.font
          font.pixelSize: 15
          color: Theme.border
          anchors.fill: parent 
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter

          text: {
            if (States.rightMenuState === 1) return "Settings"
            else if (States.rightMenuState === 2) return "Wifi"
            else return "Bluetooth"
          }
        }

        Behavior on anchors.leftMargin {
          SpringAnimation { spring: 20; damping: 1}
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
          sourceComponent: Settings {}
        }

        Loader{
          active: States.rightMenuState === 2
          anchors.fill: parent
          sourceComponent: WifiMenu {anchors.fill: parent}
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
