import QtQuick
import Quickshell
import Quickshell.Bluetooth
import "../.."
import "../../Services"

Item {
  readonly property var adapter: Bluetooth.defaultAdapter
  readonly property bool powered: adapter?.enabled ?? false
  readonly property var connectedDevice: Bluetooth.devices.values.find(d => d.connected)
  readonly property bool connected: connectedDevice !== undefined
  readonly property string deviceName: connectedDevice?.name ?? ""

  readonly property var combinedModel: {
    const all = Bluetooth.devices.values
    const known = all.filter(d => d.paired).map(d => ({ type: "device", uid: d.address, device: d }))
    const other = all.filter(d => !d.paired).map(d => ({ type: "device", uid: d.address, device: d }))
    const sep = [{ type: "separator", uid: "separator" }]
    return known.concat(sep, other)
  }

  anchors.fill: parent

  Rectangle {
    width: 125
    height: 40
    radius: 10
    anchors.left: parent.left
    anchors.top: parent.top
    color: powered ? Theme.light : Theme.dark

    MouseArea {
      anchors.fill: parent
      onClicked: adapter.enabled = !adapter.enabled
    }

    Text {
      font.family: Theme.font
      anchors.fill: parent
      color: powered ? Theme.border : Theme.text
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      text: connected ? "Connected" : powered ? "Not connected" : "Bluetooth off"
    }
  }  

  Rectangle {
    width: 125
    height: 40
    radius: 10
    anchors.top: parent.top
    anchors.right: parent.right
    color: Bluetooth.defaultAdapter?.discovering ? Theme.light : Theme.dark
    
    MouseArea {
      anchors.fill: parent
      onClicked: {
        if (Bluetooth.defaultAdapter) Bluetooth.defaultAdapter.discovering = !Bluetooth.defaultAdapter.discovering
      }
    }

    Text {
      font.family: Theme.font
      anchors.fill: parent
      color: Bluetooth.defaultAdapter?.discovering ? Theme.border : Theme.text
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      text: Bluetooth.defaultAdapter?.discovering ? "Scanning" : "Stopped"
    }
  }

  ListView {
    width: parent.width
    height: parent.height - 40
    anchors.bottom: parent.bottom
    clip: true 

    model: ScriptModel { 
      values: combinedModel
      objectProp: "uid"
    }

    delegate: Loader {
      id: rowLoader
      required property var modelData
      width: ListView.view.width
      sourceComponent: modelData.type === "separator" ? separatorComp : entryComp

      Component {
        id: separatorComp
        Rectangle {
          height: 1
          color: Theme.accent
        }
      }
      
      Component {
        id: entryComp
        BluetoothEntry {
          modelData: rowLoader.modelData
        }
      }
    }
  }
}
