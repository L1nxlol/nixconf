import QtQuick
import Quickshell.Bluetooth
import "../.."

Item {
  required property var modelData
  readonly property var device: modelData.device

  height: 65
  width: 255

  // Text {
  //   text: device.name
  //   color: Theme.text
  //   anchors.verticalCenter: parent.verticalCenter
  //   width: parent.width - 90
  //   elide: Text.ElideRight
  // }
  //
  // Rectangle {
  //   width: 20; height: 20; radius: 10
  //   color: device.connected ? Theme.accent : Theme.dark
  //   MouseArea {
  //     anchors.fill: parent
  //     onClicked: device.connected = !device.connected
  //   }
  // }
  //
  // Rectangle {
  //   visible: device.paired
  //   width: 20; height: 20; radius: 10
  //   color: Theme.border
  //   MouseArea {
  //     anchors.fill: parent
  //     onClicked: device.forget()
  //   }
  // }

  Rectangle {
    width: 30
    height: 42
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    topLeftRadius: 10
    bottomLeftRadius: 10
    color: !device.trusted ? "red" : "green"

    Text {
      font.family: Theme.font
      font.pixelSize: 30
      color: Theme.border
      anchors.fill: parent 
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      text: !device.trusted ? "󰍀" : "󰍁"
    }

    MouseArea {
      onClicked: device.trusted = !device.trusted
      anchors.fill: parent
    }
  }

  Rectangle {
    anchors.fill: parent
    anchors.leftMargin: 30
    anchors.topMargin: 6
    anchors.bottomMargin: 6
    radius: 5
    color: Theme.accent
  }
}
