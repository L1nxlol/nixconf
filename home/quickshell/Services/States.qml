pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  property bool rightMenu: false
  property bool leftMenu: false
  property int rightMenuState: 1
  property int leftMenuState: 1

  property bool wifiThingyState: false
  property bool locked: false



  property string hostname: ""
  
  FileView {
    path: "/etc/hostname"
    onLoaded: hostname = text().trim()
  } 
}
