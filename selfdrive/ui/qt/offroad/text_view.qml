import QtQuick 2.11
import QtQuick.Controls 2.4
import "../helpers"

Item {
  property alias text: label.text

  ScrollView {
    id: scroll
    anchors.fill: parent
    clip: true

    Text {
      id: label
      width: scroll.width
      wrapMode: Text.WordWrap
      color: Qt.rgba(0.788, 0.788, 0.788, 1.0)
      font.pixelSize: 42
    }
  }

  Connections {
    target: scroll
    function onContentYChanged() {
      if (scroll.contentHeight > 0 && scroll.contentY >= (scroll.contentHeight - scroll.height)) {
        TermsPage.enableAccept()
      }
    }
  }
}
