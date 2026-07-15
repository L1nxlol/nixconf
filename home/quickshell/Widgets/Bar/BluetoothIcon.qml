import QtQuick
import Quickshell
import Quickshell.Io
import "../.."
import "../../Services"

Item {
  width: 20 
  height: 20

  property bool powered: false
  property bool connected: false
  property string deviceName: ""

  Process {
    id: btStatus
    command: ["bluetoothctl", "show"]
    running: true
    stdout: StdioCollector {
      onStreamFinished: {
        powered = this.text.includes("Powered: yes")
      }
    }
  }

  Process {
    id: btDevices
    command: ["bluetoothctl", "devices", "Connected"]
    running: true
    stdout: StdioCollector {
      onStreamFinished: {
        const lines = this.text.split("\n").filter(l => l.length > 0)
        connected = lines.length > 0
        deviceName = lines.length > 0 ? lines[0].split(" ").slice(2).join(" ") : ""
      }
    }
  }

  Timer {
    interval: 2000
    running: true
    repeat: true
    onTriggered: {
      btStatus.running = true
      btDevices.running = true
    }
  }

  Text {
    font.family: Theme.font
    font.pixelSize: 18
    color: Theme.text
    anchors.fill: parent 
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    anchors.topMargin: 4
    anchors.leftMargin: 10

    text: {
      if (!powered) return "󰂲"
      else if (!connected) return "󰂰" 
      else return ""
    }
  }
}
