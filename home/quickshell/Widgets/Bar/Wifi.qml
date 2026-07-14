import QtQuick
import Quickshell
import Quickshell.Io
import "../.."
import "../../Services"

Item {
  width: 20
  height: 20

  property bool connected: false
  property bool ethernet: false
  property int signal: 0


Process {
  id: nmStatus
  command: [
    "sh", "-c", 
    `ETH=$(nmcli -t -f TYPE,STATE device | grep '^ethernet:connected$')
    WIFI=$(nmcli -t -f ACTIVE,SIGNAL dev wifi | grep '^yes:')
    if [ -n "$ETH" ]; then
      echo "ethernet"
    fi
    if [ -n "$WIFI" ]; then
      echo "$WIFI"
    fi`
  ]
  running: true
  
  stdout: StdioCollector {
    onStreamFinished: {
      ethernet = false
      connected = false
      signal = 0

      const lines = this.text.trim().split("\n")

      for (const line of lines) {
        if (line === "ethernet") {
          ethernet = true
          connected = true
        }

        else if (line.startsWith("yes:")) {
          connected = true
          signal = parseInt(line.split(":")[1])
        }
      }
    }
  }
}

  Timer {
    interval: 2500
    running: true
    repeat: true
    onTriggered: nmStatus.running = true
  }

  // property var wifiDevice: {
  //   for (const dev of Networking.devices.values) {
  //     if (dev.type === DeviceType.Wifi) return dev
  //   }
  //   return null
  // }
  //
  // property var activeNetwork: {
  //   if (!wifiDevice) return null
  //   for (const net of wifiDevice.networks.values) {
  //     if (net.connected) return net
  //   }
  //   return null
  // }
  //
  // property bool connected: activeNetwork !== null
  // property real signal: activeNetwork ? activeNetwork.signalStrength : 0


  Text {
    font.family: Theme.font
    font.pixelSize: 30
    color: Theme.text
    anchors.fill: parent 
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    anchors.topMargin: 4
    anchors.leftMargin: 10

    text: {
      if (!connected) return "󰤮"
      else if (ethernet) return "󱎔"
      else if (signal > 80) return "󰤨" 
      else if (signal > 60) return "󰤥"
      else if (signal > 40) return "󰤢"
      else if (signal > 20) return "󰤟"
      else return "󰤯"
    }
  }
}


