import Quickshell
import QtQuick
import "Services"

ShellRoot {
  Variants {
    model: Quickshell.screens

    Item {
      required property var modelData
      property var screen

      Main { screen: modelData }
      Exclusion { screen: modelData; side: "top"; thickness: 32 }
      Exclusion { screen: modelData; side: "bottom" }
      Exclusion { screen: modelData; side: "left" }
      Exclusion { screen: modelData; side: "right" }
    }
  }

  NotifPopup {}
}
