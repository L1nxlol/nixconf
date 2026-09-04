pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire

Singleton {
  property bool rightMenu: false
  property bool leftMenu: false
  property int rightMenuState: 1
  property int leftMenuState: 1
  property bool wifiThingyState: false
  property bool locked: false
  property string hostname: ""
  property bool micMuted: Pipewire.defaultAudioSource?.audio?.muted ?? false

  PwObjectTracker {
    objects: [Pipewire.defaultAudioSource]
  }

  FileView {
    path: "/etc/hostname"
    onLoaded: hostname = text().trim()
  } 
}
