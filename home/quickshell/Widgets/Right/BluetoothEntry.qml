import QtQuick
import Quickshell.Bluetooth
import "../.."

Item {
  required property var modelData
  readonly property var device: modelData.device

  height: 71
  width: 255

  anchors.bottomMargin: 4

  Rectangle {
    id: leftButton
    width: 30
    height: 42
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    topLeftRadius: 10
    bottomLeftRadius: 10
    color: !leftHover.containsMouse ? "transparent" : !device.trusted ? "red" : "green"

    Text {
      font.family: Theme.font
      font.pixelSize: 30
      color: Theme.border
      anchors.fill: parent 
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      anchors.leftMargin: 2
      text: !device.trusted ? "󰍀" : "󰍁"
    }

    MouseArea {
      onClicked: {
        device.trusted = !device.trusted
        leftButton.scale = 1.15
      }
      anchors.fill: parent
    } 

    onScaleChanged: if (scale !== 1.0) leftResetTimer.restart()
    
    Timer {
      id: leftResetTimer
      interval: 2
      onTriggered: leftButton.scale = 1.0
    }

    Behavior on scale {
      SpringAnimation { spring: 10; damping: 1 }
    }
  }

  Rectangle {
    id: rightButton
    width: 30
    height: 42
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    topRightRadius: 10
    bottomRightRadius: 10
    color: rightHover.containsMouse ? "#168ece" : "transparent"

    Text {
      font.family: Theme.font
      font.pixelSize: 30
      color: Theme.border
      anchors.fill: parent 
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      anchors.topMargin: 2
      anchors.rightMargin: 4
      text: ""
    }

    MouseArea {
      onClicked: {
        rightButton.scale = 1.15
        if (device.trusted === false) return device.forget()
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
    id: leftHover
    anchors.fill: parent
    anchors.rightMargin: 225
    hoverEnabled: true 
    acceptedButtons: Qt.NoButton
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
    anchors.leftMargin: device.paired ? leftHover.containsMouse ? 30 : 0 : 0
    anchors.rightMargin: device.paired ? rightHover.containsMouse ? 30 : 0 : 0
    anchors.topMargin: 8
    anchors.bottomMargin: 8
    radius: 5
    color: device.connected ? Theme.accent : Theme.gray
    clip: true

    Text {
      font.family: Theme.font
      font.pixelSize: 15
      color: Theme.border
      anchors.fill: parent 
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      elide: Text.ElideRight
      text: device.name
    }

    MouseArea {
      id: buttonHover
      anchors.fill: parent
      onClicked: {
        device.connected = !device.connected
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
