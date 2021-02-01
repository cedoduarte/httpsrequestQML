import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ColumnLayout {
        anchors.fill: parent
        RowLayout {
            Text {
                text: "URL"
            }

            TextField {
                Layout.fillWidth: true
                id: urlTextField
            }

            Button {
                text: "GO"
                onClicked: onGoClicked()
            }
        }

        MyTextArea {
            id: txt
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }

    function onGoClicked() {
        var url = urlTextField.text;
        var req = new XMLHttpRequest();
        req.open('GET', url, true);
        req.onreadystatechange = function (aEvt) {
            if (req.readyState === 4) {
                if(req.status === 200) {
                    txt.text = req.responseText;
                } else {
                    txt.text = "Error loading page";
                }
            }
        };
        req.send(null);
    }
}
