import QtQuick
import Quickshell
import Quickshell.Bluetooth
import "../.."
import "../../Services"

Item {
  id: root
  width: 20
  height: 20

  readonly property var adapter: Bluetooth.defaultAdapter
  readonly property bool powered: adapter?.enabled ?? false
  readonly property var connectedDevice: Bluetooth.devices.values.find(d => d.connected)
  readonly property bool connected: connectedDevice !== undefined
  readonly property string deviceName: connectedDevice?.name ?? ""


  Icon {
    anchors.fill: parent
    anchors.topMargin: 4
    anchors.leftMargin: 10
    family: Theme.font
    size: 20
    color: Theme.highlight
    icon: {
      if (!root.powered) return "󰂲"
      else if (!root.connected) return "󰂰"
      else return ""
    }
  }
}
