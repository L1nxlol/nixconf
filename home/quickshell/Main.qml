import QtQuick
import Quickshell
import Quickshell.Wayland
import "Widgets/Bar"
import "Widgets/Right"
import "Widgets/Left"
import "Services"

PanelWindow {
  property int topSide: 32
  property int sides: 7
  property int leftSide: States.leftMenu ? 300 : 7
  property int rightSide: States.rightMenu ? 300 : 7
  id: root
  
  color: "transparent"
  exclusionMode: ExclusionMode.Ignore
  WlrLayershell.layer: States.locked ? WlrLayer.Overlay : WlrLayer.Top

  anchors {
    top: true
    bottom: true
    left: true
    right: true
  }
  
  Rectangle { // Outer border
    anchors.topMargin: topSide - 40  
    anchors.bottomMargin: sides - 40
    anchors.leftMargin: leftSide - 40
    anchors.rightMargin: rightSide - 40

    anchors.fill: parent
    color: "transparent"
    border.color: Theme.dark
    border.width: 40
    
    radius: 63
  }

  Rectangle { // Fill
    anchors.topMargin: topSide - 500
    anchors.bottomMargin: sides - 500
    anchors.leftMargin: leftSide - 500
    anchors.rightMargin: rightSide - 500

    anchors.fill: parent
    color: "transparent"
    border.color: Theme.dark
    border.width: 500
    
    radius: 63
  }
  
  Rectangle { // Inner border
    anchors.topMargin: topSide 
    anchors.bottomMargin: sides
    anchors.leftMargin: leftSide
    anchors.rightMargin: rightSide

    anchors.fill: parent
    color: "transparent"
    border.color: Theme.border
    border.width: 4

    radius: 20

    RightMenu {
      id: rightMenu
      anchors.top: parent.top
      anchors.left: parent.right
      anchors.leftMargin: 15
    }

    LeftMenu {
      id: leftMenu
      anchors.top: parent.top
      anchors.right: parent.left
      anchors.rightMargin: -15
    }

    MouseArea {
      id: autoHideArea
      anchors.fill: parent
      hoverEnabled: true 
      acceptedButtons: Qt.NoButton
      onEntered: {
        States.leftMenu = false
        States.rightMenu = false
      }
    }
  }  
  
  Rectangle{ // Actual bar
    implicitHeight: 32
    color: "transparent"
    id: bar

    anchors { 
      top: parent.top
      left: parent.left
      right: parent.right 
    }
    
    Row {
      anchors.left: parent.left
      anchors.leftMargin: 5
      anchors.verticalCenter: parent.verticalCenter
      spacing: 10

      Clock {
        anchors.leftMargin: 30
      }

      Logo {}
    }

    Pill {
      anchors.centerIn: parent
      screen: root.screen
      id: pill
    }

    RightContainer {
      id: rightContainerce7050
      anchors.rightMargin: 10
    }
  }
  
  Behavior on rightSide {
    SpringAnimation { 
      spring: States.rightMenu ? 10 : 3.5
      damping: States.rightMenu ? 1 : 0.25 
    }
  }

  Behavior on leftSide {
    SpringAnimation { 
      spring: States.leftMenu ? 10 : 3.5
      damping: States.leftMenu ? 1 : 0.25 
    }
  }
  
  property Region sidesClosed: Region {
    item: bar
    Region { item: rightMenu }
    Region { item: leftMenu }
  }
  
  property Region sidesOpen: Region {
    item: bar
    Region { item: rightMenu }
    Region { item: leftMenu }
    Region { item: autoHideArea }
  }

  mask: (States.leftMenu || States.rightMenu) ? sidesOpen : sidesClosed
}
