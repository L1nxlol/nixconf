pragma Singleton
import QtQuick

QtObject {
  property bool rightMenu: false
  property bool leftMenu: false
  property int rightMenuState: 1
  property int leftMenuState: 1

  property bool wifiThingyState: false
  property bool locked: false
}
