import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import "../.."

Rectangle {
  required property var modelData
  property bool active: modelData.active

  anchors.verticalCenter: parent.verticalCenter

  width: 16
  height: 16
  radius: 10

  color: active ? Theme.accent : Theme.light

  MouseArea {
    anchors.fill: parent
    acceptedButtons: Qt.LeftButton | Qt.MiddleButton
    onClicked: mouse => {
      if (mouse.button === Qt.LeftButton) {
        Hyprland.dispatch(`hl.dsp.focus({ workspace = "${modelData.id}" })`);
      } else if (mouse.button === Qt.MiddleButton) {
        Quickshell.execDetached(["bash", "-c", `hyprctl -j clients | jq -r '.[] | select(.workspace.id==${modelData.id}) | .address' | xargs -I{} hyprctl dispatch closewindow address:{}`]);
      }
    }
  }

  Text{
    anchors.centerIn: parent
    text: modelData.id >= 11 ? modelData.id - 10 : modelData.id
    color: Theme.dark
    font.pixelSize: 12
  }
}
