import QtQuick
import Quickshell
import Quickshell.Wayland
import ".."
import "../Widgets/Left"

PanelWindow {
  id: popoutRoot
  visible: repeater.count > 0

  WlrLayershell.layer: WlrLayer.Overlay
  anchors { top: true; left: true }
  margins { top: 10; left: 10 }
  implicitWidth: 320
  implicitHeight: col.implicitHeight
  color: "transparent"

  Column {
    id: col
    spacing: 8
    width: parent.width

    Repeater {
      id: repeater
      model: NotifServer.activePopups

      NotifEntry {
        id: entryDelegate
        required property string appName
        required property string summary
        required property string body
        required property string appIcon
        required property int urgency
        required property var timestamp
        required property var notifId   // renamed from "id" — avoid colliding with QML's own id keyword

        notif: ({
          appName: appName,
          summary: summary,
          body: body,
          appIcon: appIcon,
          urgency: urgency,
          timestamp: timestamp,
          id: notifId
        })

        width: col.width

        Timer {
          interval: 4000
          running: true
          repeat: false
          onTriggered: NotifServer.expirePopup(entryDelegate.notifId)
        }
      }
    }  
  }
}
