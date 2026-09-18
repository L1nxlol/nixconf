import QtQuick
import "../.."

Rectangle {
  id: root

  required property string icon
  property int iconSize: 50
  property int iconOffsetX: 0
  property int iconOffsetY: 0

  signal activated()

  property bool armed: false

  height: 50
  width: 50
  radius: 5
  // color: armed ? Theme.accent : Theme.light
  color: Theme.light

  Behavior on color {
    ColorAnimation { duration: 60 }
  }

  Behavior on scale {
    NumberAnimation { duration: 200; easing.type: Easing.OutQuad }
  }

  Timer {
    id: armTimer
    interval: 1000
    onTriggered: root.armed = false
  }

  Item {
    anchors.fill: parent
    anchors.leftMargin: root.iconOffsetX
    anchors.topMargin: root.iconOffsetY

    Text {
      anchors.centerIn: parent
      font.family: Theme.font
      font.pixelSize: root.iconSize
      color: Theme.border
      text: root.icon
    }
  }

  MouseArea {
    anchors.fill: parent
    onPressed: root.scale = 0.88
    onReleased: root.scale = 1.0
    onCanceled: root.scale = 1.0
    onClicked: {
      if (root.armed) {
        armTimer.stop()
        root.armed = false
        root.activated()
      } else {
        root.armed = true
        armTimer.restart()
      }
    }
  }
}
