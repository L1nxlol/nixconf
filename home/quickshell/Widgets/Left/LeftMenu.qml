import QtQuick
import Quickshell
import "../.."
import "../../Bar"
import "../../Services"
import "Settings"

Loader {
  active: States.leftMenu || closeTimer.running

  Timer {
    id: closeTimer
    interval: 400 
    onTriggered: {} 
  }

  onLoaded: {} 

  Connections {
    target: States
    function onLeftMenuChanged() {
      if (!States.leftMenu) closeTimer.start()
    }
  }

  sourceComponent: Column {
    spacing: 15
    height: 1900
    width: 300

    Rectangle {
      height: 1032
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
          onClicked: States.leftMenuState = 2
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
          onClicked: States.leftMenuState = 1
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
          onClicked: States.leftMenuState = 3
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
          if (States.leftMenuState === 1) return 0
          else if (States.leftMenuState === 2) return 90
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
            if (States.leftMenuState === 1) return "Settings"
            else if (States.leftMenuState === 2) return "Wifi"
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

        Rectangle {
          anchors.fill: parent
          color: Theme.accent
        }

        // Loader{
        //   active: States.rightMenuState === 1
        //   anchors.fill: parent
        //   sourceComponent: Settings {}
        // }
        //
        // Loader{
        //   active: States.rightMenuState === 2
        //   anchors.fill: parent
        //   sourceComponent: WifiMenu {anchors.fill: parent}
        // }
        //
        // Loader{
        //   active: States.rightMenuState === 3
        //   anchors.fill: parent
        //   sourceComponent: BluetoothMenu {anchors.fill: parent}
        // }
      }
    }
  }
}
