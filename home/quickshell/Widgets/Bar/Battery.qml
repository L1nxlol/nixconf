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
    width: 44
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
        text: " " + parent.batPercentage + "%"
      }

      Text {
        font.family: Theme.font
        font.pixelSize: 12
        color: Theme.highlight
        text: {
          if (parent.fullyCharged) return "󱟢 ";

          else if (parent.charging) {
            if (parent.batPercentage > 80) return "󰂅 ";
            else if (parent.batPercentage > 60) return "󰢞 ";
            else if (parent.batPercentage > 40) return "󰢝 ";
            else if (parent.batPercentage > 20) return "󰂇 ";
            else return "󰢟 ";
          }

          else if (parent.batPercentage > 80) return "󰁹 ";
          else if (parent.batPercentage > 60) return "󰂀 ";
          else if (parent.batPercentage > 40) return "󰁾 ";
          else if (parent.batPercentage > 20) return "󰁼 ";
          else return "󱃍 ";
        }
      }
    }
  }
}
}
