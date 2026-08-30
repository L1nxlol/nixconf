import QtQuick
import "../../"

Rectangle {
  anchors.left: parent.left
  anchors.verticalCenter: parent.verticalCenter
  color: Theme.border
  radius: 20
  height: 24
  width: timeHM.implicitWidth + 15

  Timer {
    interval: 1000 
	  onTriggered: {
	    timeHM.text = Qt.formatDateTime(new Date(), "hh:mm")
	  }
	  running: true
	  repeat: true 
  }

	Text {
	  id: timeHM 
	  text: Qt.formatDateTime(new Date(), "hh:mm")
	  color: Theme.highlight
	  font.family: Theme.font
	  font.pixelSize: 14
	  anchors.centerIn: parent
  }
}
