import Quickshell
import QtQuick
import "../../.." 
import "../../../Services"

Rectangle{
  anchors.fill: parent
  anchors.leftMargin: 4
  anchors.rightMargin: 4
  anchors.topMargin: 4
  anchors.bottomMargin: 4
  radius: 20
  color: Theme.dark
  
  Column {
    anchors.topMargin: 10
    spacing: 5
    anchors.fill: parent

    SwitchEntry {
      eName: "Do Not Disturb"
      isToggled: NotifServer.dndStatus
      onToggleRequest: NotifServer.dndStatus = !NotifServer.dndStatus
    }

    SwitchEntry {
      eName: "Wifi Thingy"
      isToggled: States.wifiThingyState
      onToggleRequest: States.wifiThingyState = !States.wifiThingyState
    }

    SwitchEntry {
      eName: "Microphone Mute"
      isToggled: States.micMuted
      onToggleRequest: States.micMuted = !States.micMuted
    }

    SwitchEntry {
      eName: "Locked"
      isToggled: States.locked
      onToggleRequest: States.locked = ~States.locked
    }

    ButtonEntry {
      eName: "Rebuild"
      onClickRequest: Quickshell.execDetached(["kitty", "--class", "kitty-float", "-e", "bash", "-c", "sudo nixos-rebuild switch --flake ~/Nix --impure; exec bash"])
    }

    ButtonEntry {
      eName: "Hm Rebuild"
      onClickRequest: Quickshell.execDetached(["kitty", "--class", "kitty-float", "-e", "bash", "-c", "home-manager switch --flake ~/Nix; exec bash"])
    }

    ButtonEntry {
      eName: "Update"
      onClickRequest: Quickshell.execDetached(["kitty", "--class", "kitty-float", "-e", "bash", "-c", "sudo nix flake update --flake ~/Nix; exec bash"])
    }

    // hot corners
    // lang sellect
    // battery saver
  }
}
