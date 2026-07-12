import QtQuick
import Quickshell
import Quickshell.Wayland
import "Widgets/Static"

PanelWindow {
  property int sides: 10
  id: root
  // required property var modelData
  // screen: modelData
  
  color: "transparent"
  exclusionMode: ExclusionMode.Ignore
  WlrLayershell.layer: WlrLayer.Top

  anchors {
    top: true
    bottom: true
    left: true
    right: true
  }
  
  Rectangle { // Outer border
    anchors.topMargin: -10  
    anchors.bottomMargin: sides - 40
    anchors.leftMargin: sides - 40
    anchors.rightMargin: sides - 40

    anchors.fill: parent
    color: "transparent"
    border.color: Theme.dark
    border.width: 40
    
    radius: 63
  }
  
  Rectangle { // Inner border
    anchors.topMargin: 30 
    anchors.bottomMargin: sides
    anchors.leftMargin: sides
    anchors.rightMargin: sides

    anchors.fill: parent
    color: "transparent"
    border.color: Theme.border
    border.width: 4

    radius: 20
  }  
  
  Rectangle{ // Accual bar
    implicitHeight: 32
    color: "transparent"

    anchors { 
      top: parent.top
      left: parent.left
      right: parent.right 
    }
    
    Clock {
      anchors.left: parent.left
      anchors.leftMargin: 10
    }

    Pill {
      anchors.centerIn: parent
      screen: root.screen
      id: pill
    }
  }
  
  
  
  mask: Region {
    item: pill
  }
}
