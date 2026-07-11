import Quickshell
import QtQuick

ShellRoot {
  Variants {
    model: Quickshell.screens

    Item {
      required property var modelData

      Main { screen: modelData; sides: 7 }
      Exclusion { screen: modelData; side: "top"; thickness: 30 }
      Exclusion { screen: modelData; side: "bottom" }
      Exclusion { screen: modelData; side: "left" }
      Exclusion { screen: modelData; side: "right" }
    }
  }
}
