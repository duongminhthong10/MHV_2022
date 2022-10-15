import QtQuick 2.0
import QtQuick.Controls 2.15
Button
{
    id: btnBack
    width: 0.062 * wW
    height: 0.042 * wH
    anchors {top: parent.top; topMargin: 0.013 * wH; right: parent.right; rightMargin: 0.008 * wW}
    background: Rectangle {
        anchors.fill: parent
        radius: 6
        border.width: 1
        border.color: "white"
        color: "#9d803e"
    }
    contentItem: Text {
        text: qsTr("QUAY LẠI")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: btnBack.height * 0.4
        color: "white"
    }
    onClicked:
    {
        TcpClient.sendOnly(option,"DKTC_" + DataBase.queryDanhSachCong(tableCong,toaUrl[0],tangMay,"mapCongArray"))
        console.log(DataBase.queryDanhSachCong(tableCong,toaUrl[0],tangMay,"mapCongArray").toString());
        mainStackView.pop()
    }

}
