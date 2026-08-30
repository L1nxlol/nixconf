import QtQuick
import Quickshell
import Quickshell.Bluetooth
import "../.."

Item {
    id: root
    width: 20
    height: 20

    readonly property var adapter: Bluetooth.defaultAdapter
    readonly property bool powered: adapter?.enabled ?? false
    readonly property var connectedDevice: Bluetooth.devices.values.find(d => d.connected)
    readonly property bool connected: connectedDevice !== undefined
    readonly property string deviceName: connectedDevice?.name ?? ""


    Text {
        anchors.fill: parent
        anchors.topMargin: 4
        anchors.leftMargin: 10
        font.family: Theme.font
        font.pixelSize: 18
        color: Theme.highlight
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: {
          if (!root.powered) return "󰂲"
          else if (!root.connected) return "󰂰"
          else return ""
        }
      }
}
