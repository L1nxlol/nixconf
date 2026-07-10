import QtQuick
import "../../"
import Quickshell.Hyprland

Flickable {
  id: flick
  width: row.width
  height: 17
  contentWidth: row.width
  interactive: false
  anchors.horizontalCenter: parent.horizontalCenter

  ListModel {
    id: wsModel
  }

  function syncWorkspaces() {
    let current = []
    for (let i = 0; i < Hyprland.workspaces.values.length; i++) {
      let ws = Hyprland.workspaces.values[i]
      if (ws.id <= 10) current.push(ws)
    }

    // Remove entries no longer present
    for (let i = wsModel.count - 1; i >= 0; i--) {
      let stillExists = false
      for (let j = 0; j < current.length; j++) {
        if (current[j].id === wsModel.get(i).id) { stillExists = true; break }
      }
      if (!stillExists) wsModel.remove(i)
    }

    // Add new entries, update existing ones
    for (let ws of current) {
      let idx = -1
      for (let i = 0; i < wsModel.count; i++) {
        if (wsModel.get(i).id === ws.id) { idx = i; break }
      }
      if (idx === -1) {
        wsModel.append({ id: ws.id, active: ws.active })
      } else {
        wsModel.setProperty(idx, "active", ws.active)
      }
    }
  }

  Connections {
    target: Hyprland.workspaces
    function onValuesChanged() { syncWorkspaces() }
  }

  Component.onCompleted: syncWorkspaces()

  Row {
    id: row
    spacing: 6

    move: Transition {
      NumberAnimation {
        properties: "x,y"
        duration: 300
        easing.type: Easing.OutCubic
      }
    }
    add: Transition {
      NumberAnimation {
        property: "opacity"
        from: 0
        to: 1
        duration: 300
      }
    }

    Repeater {
      model: wsModel
      delegate: Rectangle {
        width: 16
        height: 16
        radius: 8
        color: model.active ? Theme.accent : Theme.light

        Behavior on color {
          ColorAnimation { duration: 150 }
        }

        Text {
          anchors.centerIn: parent
          text: model.id
          font.pixelSize: 9
          color: Theme.text
        }
      }
    }
  }
}
