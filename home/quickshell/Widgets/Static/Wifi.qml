import QtQuick
import Quickshell
import Quickshell.Io
import "../.."
import "../../Services"

Process {
  id: nmStatus
  command: ["nmcli", "-t", "-f", "active,signal", "dev", "wifi"]
  running: true
  stdout: StdioCollector {
    onStreamFinished: {
      const lines = this.text.split("\n")
      const activeLine = lines.find(line => line.startsWith("yes:"))
      if (activeLine) {
        connected = true
        signal = parseInt(activeLine.split(":")[1])
      } else {
        connected = false
        signal = 0
      }
    }
  }
}

Text {

}
