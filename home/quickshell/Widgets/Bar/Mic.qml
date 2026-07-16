import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import "../.."
import "../../Services/"

Rectangle {
  property var micNode: Pipewire.defaultAudioSource
  property bool isMuted: micNode?.audio?.muted ?? true

  PwObjectTracker {
    objects: [micNode]
  } 

  property bool micInUse: {
    return Pipewire.links.values.some(link => link.target === micNode && link.state === PwLinkState.Active)
  }


  color: micInUse ? Theme.accent : Theme.border
  width: 24
  height: 24
  radius: 20

  Text {
    font.family: Theme.font
    font.pixelSize: 30
    color: micInUse? Theme.border : Theme.text
    anchors.fill: parent 
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    text: isMuted? "" : ""
  }

  MouseArea {
    anchors.fill: parent
    onClicked: Quickshell.execDetached(["wpctl", "set-mute", "@DEFAULT_AUDIO_SOURCE@", "toggle"])
  }
}
