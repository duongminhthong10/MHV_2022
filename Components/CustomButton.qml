import QtQuick 2.0
import QtQuick.Controls 2.3
Button {
    background: Rectangle {
        anchors.fill: parent
        color: (checked || pressed) ? "blue" : "transparent"
        opacity: 0.2
//        color: "red"
        radius: 3
    }
    contentItem: Text {
        text: parent.text
        font: parent.font
        opacity: 0
        color: "#376092"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    font.family: "Tahoma"
    font.pixelSize: height * 0.3
}
