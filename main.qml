import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
//import QtMultimedia 5.15

ApplicationWindow {
    id: appwindow
    visible: true
//    visibility: "FullScreen"
    visibility: active ? "FullScreen" : "Maximized"
    width: 1280
    height: 800
    title: qsTr("SunShine Diamond River")
    property alias wW: appwindow.width
    property alias wH: appwindow.height
    property double x_default: 0.85

    property string toaUrl
    property int soTang
    property string tangUrl
    property string tangMay

    // danh sach anh phong noi that
    property var imgList : []

    // cac table DB
    property string tablebuilding : "tblViewBuilding"
    property string tableFloor: "tblFloorPort"
    /*viet them*/
    property string tableCong: "tblPhong"
    property int option
    //    Component.onCompleted: {
    //        TcpClient.send("HU01")
    //    }

    // tim loai phong
    property string room: ""
    StackView {
        id: mainStackView
        anchors.fill: parent
        initialItem: Mainview{}
        onDepthChanged: {
            if(depth == 1)
            {
                TcpClient.send("HU01")
            }
        }

        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 400
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 400
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 400
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 400
            }
        }
    }
}
