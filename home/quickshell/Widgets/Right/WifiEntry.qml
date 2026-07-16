import QtQuick
import Quickshell.Networking
import "../.."

Item {
  required property var modelData
  readonly property var network: modelData.network

  height: 71
  width: 255

  anchors.bottomMargin: 4

  Rectangle {
    id: rightButton
    width: 30
    height: 42
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    topRightRadius: 10
    bottomRightRadius: 10
    color: rightHover.containsMouse ? "red" : "transparent"

    Text {
      font.family: Theme.font
      font.pixelSize: 30
      color: Theme.border
      anchors.fill: parent 
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      anchors.topMargin: 2
      anchors.rightMargin: 4
      text: ""
    }

    MouseArea {
      onClicked: {
        rightButton.scale = 1.15
        network.forget()
      }
      anchors.fill: parent
    }  

    onScaleChanged: if (scale !== 1.0) rightResetTimer.restart()
    
    Timer {
      id: rightResetTimer
      interval: 2
      onTriggered: rightButton.scale = 1.0
    }

    Behavior on scale {
      SpringAnimation { spring: 10; damping: 1 }
    }
  }

  MouseArea {
    id: rightHover
    anchors.fill: parent
    anchors.leftMargin: 225
    hoverEnabled: true 
    acceptedButtons: Qt.NoButton
  }

  Rectangle {
    id: mainButton
    anchors.fill: parent
    anchors.rightMargin: network.known ? rightHover.containsMouse ? 30 : 0 : 0
    anchors.topMargin: 8
    anchors.bottomMargin: 8
    radius: 5
    color: network.connected ? Theme.accent : Theme.gray
    clip: true

    Text {
      font.family: Theme.font
      font.pixelSize: 15
      color: Theme.border
      anchors.fill: parent 
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      elide: Text.ElideRight
      text: network.name
    }

    MouseArea {
      id: buttonHover
      anchors.fill: parent
      onClicked: {
        onClicked: network.connected ? network.disconnect() : network.connect()
        mainButton.scale = 0.9
      }
    }

    onScaleChanged: if (scale !== 1.0) mainResetTimer.restart()

    Timer {
      id: mainResetTimer
      interval: 1
      onTriggered: mainButton.scale = 1.0
    }

    Behavior on scale {
      SpringAnimation { spring: 20; damping: 1}
    }
    
    Behavior on anchors.leftMargin {
      SpringAnimation { spring: 20; damping: 1}
    }

    Behavior on anchors.rightMargin {
      SpringAnimation { spring: 20; damping: 1}
    }
  }
}
