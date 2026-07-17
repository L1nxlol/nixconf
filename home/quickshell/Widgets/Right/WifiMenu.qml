import QtQuick
import Quickshell
import Quickshell.Networking
import "../.."
import "../../Services"

Item {
readonly property var wifiDevice: {
  for (const dev of Networking.devices.values) {
    if (dev.type === DeviceType.Wifi) return dev
  }
  return null
}

readonly property var wiredDevice: {
  for (const dev of Networking.devices.values) {
    if (dev.type === DeviceType.Wired) return dev
  }
  return null
}

readonly property var connectedNetwork: wifiDevice ? wifiDevice.networks.values.find(n => n.connected) : null
readonly property bool powered: Networking.wifiEnabled
readonly property bool connected: wifiDevice ? wifiDevice.connected : false

readonly property var combinedModel: {
  const wifiNets = wifiDevice ? wifiDevice.networks.values : []

  const known = wifiNets.filter(n => n.known).map(n => ({ type: "network", uid: n.name, network: n }))
  const unknown = wifiNets.filter(n => !n.known).map(n => ({ type: "network", uid: n.name, network: n }))

  const wired = (wiredDevice && wiredDevice.hasLink && wiredDevice.network)
    ? [{ type: "network", uid: "wired:" + wiredDevice.network.name, network: wiredDevice.network }]
    : []

  const sep1 = (wired.length > 0 && known.length > 0) ? [{ type: "separator", uid: "sep1" }] : []
  const sep2 = (known.length > 0 && unknown.length > 0) ? [{ type: "separator", uid: "sep2" }] : []

  return wired.concat(sep1, known, sep2, unknown)
}

  onCombinedModelChanged: console.log("wifi total:", wifiNets.length, "known:", known.length, "unknown:", unknown.length)

  anchors.fill: parent

  Rectangle {
    width: 125
    height: 40
    radius: 10
    anchors.top: parent.top
    anchors.left: parent.left
    color: powered ? Theme.light : Theme.dark

    MouseArea {
      anchors.fill: parent
      onClicked: Networking.wifiEnabled = !Networking.wifiEnabled
    }

    Text {
      font.family: Theme.font
      anchors.fill: parent
      color: powered ? Theme.border : Theme.text
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      text: connected ? "Connected" : powered ? "Not connected" : "Wifi off"
    }
  }

  Rectangle {
    width: 125
    height: 40
    radius: 10
    anchors.top: parent.top
    anchors.right: parent.right
    color: wifiDevice?.scannerEnabled ? Theme.light : Theme.dark

    MouseArea {
      anchors.fill: parent
      onClicked: {
        if (wifiDevice) wifiDevice.scannerEnabled = !wifiDevice.scannerEnabled
      }
    }

    Text {
      font.family: Theme.font
      anchors.fill: parent
      color: wifiDevice?.scannerEnabled ? Theme.border : Theme.text
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      text: wifiDevice?.scannerEnabled ? "Scanning" : "Stopped"
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
        WifiEntry {
          modelData: rowLoader.modelData
        }
      }
    }
  }
}
