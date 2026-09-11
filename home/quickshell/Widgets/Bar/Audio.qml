import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import "../.."
import "../../Services"

Rectangle {
  id: root
  anchors.left: parent.left
  anchors.verticalCenter: parent.verticalCenter
  color: Theme.border
  radius: height / 2
  height: 24
  width: hoverArea.containsMouse ? 100 : 24
  clip: true 

  readonly property real volume: Pipewire.defaultAudioSink?.audio.volume ?? 0

  PwObjectTracker {
    objects: [ Pipewire.defaultAudioSink ]
  }

  Behavior on width {
    NumberAnimation { duration: 150; easing.type: Easing.OutCubic }
  }

  RowLayout {
    anchors.fill: parent
    anchors.leftMargin: 4
    anchors.rightMargin: 10
    spacing: 6

    Text {
      Layout.preferredWidth: 16
      Layout.fillHeight: true
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      // anchors.centerIn: parent
      font.family: Theme.font
      font.pixelSize: 30
      color: Theme.highlight
      text: {
        const vol = root.volume
        if (vol <= 0) return ""
        else if (vol < 0.3) return ""
        else if (vol < 0.65) return ""
        else return ""
      }
    }

Rectangle {
  Layout.fillWidth: true
  Layout.preferredHeight: 6
  radius: height / 2
  color: "#50ffffff"
  opacity: hoverArea.containsMouse ? 1 : 0

  Rectangle {
    anchors { left: parent.left; top: parent.top; bottom: parent.bottom }
    width: parent.width * root.volume
    radius: parent.radius
    color: Theme.highlight
  }

  MouseArea {
    anchors.fill: parent
    onPressed: mouse => setVolumeFromX(mouse.x)
      
    onPositionChanged: mouse => {
      if (pressed) setVolumeFromX(mouse.x)
    }

    function setVolumeFromX(x) {
      const sink = Pipewire.defaultAudioSink
      if (!sink?.ready || !sink?.audio) return
      const pct = Math.max(0, Math.min(1, x / width))
      sink.audio.volume = pct
    }
  }

  Behavior on opacity {
    NumberAnimation { duration: 100 }
  }
}
  }

  MouseArea {
    id: hoverArea
    anchors.fill: parent
    hoverEnabled: true
    acceptedButtons: Qt.NoButton
  }
}
