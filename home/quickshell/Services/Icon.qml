import QtQuick
import ".."

Item {
  id: root

  property real yTrim: 0

  property string icon: ""
  property int size: 16
  property color color: Theme.highlight
  property string family: Theme.iconFont

  implicitWidth: size
  implicitHeight: size

  TextMetrics {
    id: tm
    font: glyph.font
    text: glyph.text
  }

  Text {
    id: glyph
    text: root.icon
    color: root.color
    font.family: root.family
    font.pixelSize: root.size

    x: Math.round(root.width / 2 - (tm.tightBoundingRect.x + tm.tightBoundingRect.width / 2))
    // y: Math.round(root.height / 2 - (baselineOffset + tm.tightBoundingRect.y + tm.tightBoundingRect.height / 2))
    y: Math.round(root.height / 2 - (baselineOffset + tm.tightBoundingRect.y + tm.tightBoundingRect.height / 2) + root.yTrim * root.size)
  }
}
