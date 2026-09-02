import Quickshell
import QtQuick
import Quickshell.Services.UPower
import "../../"
import "../../Services/"

Item {
  id: batroot
  anchors.verticalCenter: parent.verticalCenter
Loader {
  active: States.hostname === "laptop"
  anchors.verticalCenter: batroot.verticalCenter

  sourceComponent: Rectangle {
    color: Theme.border
    anchors.verticalCenter: batroot.verticalCenter
    width: 35
    height: 24
    radius: 20

    Row {
      spacing: 2  
      anchors.verticalCenter: parent.verticalCenter
      
      property var device: UPower.displayDevice
      property bool charging: device.state === UPowerDeviceState.Charging
      property bool fullyCharged: device.state === UPowerDeviceState.FullyCharged
      property int batPercentage: Math.round(device.percentage * 100)

      Text {
        anchors.verticalCenter: parent.verticalCenter
        font.family: Theme.font
        font.pixelSize: 10
        color: Theme.highlight
        text: parent.batPercentage + "%"
      }

      Text {
        font.family: Theme.font
        font.pixelSize: 12
        color: Theme.highlight
        text: {
          if (parent.fullyCharged) return "F"
          else if (parent.charging) return "C"
          else if (parent.batPercentage > 75) return "75"
          else if (parent.batPercentage > 50) return "50"
          else if (parent.batPercentage > 50) return "50"
          else return "t"
        }
      }
    }
  }
}
}
