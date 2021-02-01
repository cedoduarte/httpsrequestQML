import QtQuick 2.12
import QtQuick.Controls 2.5

Flickable {
    property alias text: textArea.text
    property alias textArea: textArea
    id: flickable

    TextArea.flickable: TextArea {
        id: textArea
        selectByKeyboard: true
        selectByMouse: true
        wrapMode: TextArea.Wrap
    }

    ScrollBar.vertical: ScrollBar {}
}
