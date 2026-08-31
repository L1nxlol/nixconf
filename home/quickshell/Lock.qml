import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick
import "Services"

PanelWindow {
  WlrLayershell.layer: WlrLayer.Overlay
  color: "transparent"

  width: 1902
  height: 1035

  mask: States.locked ? fullRegion : emptyRegion


  Region {
    id: emptyRegion
  }

  Region {
    id: fullRegion
    x: 0
    y: 0
    width: 1920
    height: 1080
  }

IpcHandler {
  target: "screen-lock"
  function lock() {
    States.locked = !States.locked
  }
}

Rectangle {
  id: lockWindow
  width: 400
  height: 250
  radius: 20
  color: Theme.dark

  border.color: Theme.border
  border.width: 3

  x: (parent.width - width) / 2
  y: parent.height

  signal unlocked()

  property bool active: States.locked
  onActiveChanged: active ? introSequence.start() : outroSequence.start()

  SequentialAnimation {
      id: introSequence

    ParallelAnimation {
      NumberAnimation { target: lockWindow; property: "y"; to: (lockWindow.parent.height - lockWindow.height) / 2; duration: 250; easing.type: Easing.OutBack }
      NumberAnimation { target: lockWindow; property: "x"; to: (lockWindow.parent.width - lockWindow.width) / 2; duration: 250; easing.type: Easing.InCubic }
    }

    ParallelAnimation {
      NumberAnimation { target: lockWindow; property: "width";  to: lockWindow.parent.width;  duration: 350; easing.type: Easing.OutExpo }
      NumberAnimation { target: lockWindow; property: "height"; to: lockWindow.parent.height; duration: 350; easing.type: Easing.OutExpo }
      NumberAnimation { target: lockWindow; property: "x"; to: 0; duration: 350; easing.type: Easing.OutExpo }
      NumberAnimation { target: lockWindow; property: "y"; to: 0; duration: 350; easing.type: Easing.OutExpo }
    }
  }

  SequentialAnimation {
    id: outroSequence

    ParallelAnimation {
      NumberAnimation { target: lockWindow; property: "width";  to: 400; duration: 300; easing.type: Easing.InExpo }
      NumberAnimation { target: lockWindow; property: "height"; to: 250; duration: 300; easing.type: Easing.InExpo }
      NumberAnimation { target: lockWindow; property: "x"; to: (lockWindow.parent.width - 400) / 2;  duration: 300; easing.type: Easing.InExpo }
      NumberAnimation { target: lockWindow; property: "y"; to: (lockWindow.parent.height - 250) / 2; duration: 300; easing.type: Easing.InExpo }
    }

    ParallelAnimation {
      NumberAnimation { target: lockWindow; property: "y"; to: lockWindow.parent.height; duration: 250; easing.type: Easing.InBack }
      NumberAnimation { target: lockWindow; property: "x"; to: (lockWindow.parent.width - 400) / 2; duration: 250; easing.type: Easing.OutCubic }
    }
  }
}
}
