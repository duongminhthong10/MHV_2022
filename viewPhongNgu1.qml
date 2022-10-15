import QtQuick 2.0
import QtQuick.Controls 2.15
Item {
    property string room: "1PN"
    Component.onCompleted: {
        console.log("phong ngu 1")
        console.log(DataBase.queryCacLoaiPhong(tableCong,toaUrl[0],tangMay,room,"mapCongArray"))
        TcpClient.sendOnly(option, "DKTC_" + DataBase.queryCacLoaiPhong(tableCong,toaUrl[0],tangMay,room,"mapCongArray"))
    }
    property var imgList: [
        "image/NoiThat/1PN/1.jpg",
        "image/NoiThat/1PN/2.jpg",
        "image/NoiThat/1PN/3.jpg",
        "image/NoiThat/1PN/4.jpg",
        "image/NoiThat/1PN/5.jpg",
        "image/NoiThat/1PN/6.jpg"
    ]
    Rectangle {
        id :bg
        anchors.fill: parent
        color: "#CCCCCC"
    }
    Image {
        width: wW * 0.033
        height: wH * 0.088
        source: "image/previous.png"
        anchors.left: parent.left
        anchors.leftMargin: wW * 0.02
        anchors.verticalCenter: parent.verticalCenter
        scale: previousBtnMA.pressed ? 0.9 : 1
        MouseArea {
            id: previousBtnMA
            anchors.fill: parent
            onClicked: {
                if (swpImg.currentIndex == 0) swpImg.currentIndex = swpImg.count - 1
                else swpImg.currentIndex--
                /* Re-binding after we broke it (assigned a static value) */
                swpImg.currentIndex = Qt.binding(function() { return indicator.currentIndex })
            }
        }
    }
    Image {
        width: wW * 0.033
        height: wH * 0.088
        source: "image/next.png"
        anchors.right: parent.right
        anchors.rightMargin: wW * 0.02
        anchors.verticalCenter: parent.verticalCenter
        scale: nextBtnMA.pressed ? 0.9 : 1
        MouseArea {
            id: nextBtnMA
            anchors.fill: parent
            onClicked: {
                if (swpImg.currentIndex == (swpImg.count - 1)) swpImg.currentIndex = 0
                else swpImg.currentIndex++
                /* Re-binding after we broke it (assigned a static value) */
                swpImg.currentIndex = Qt.binding(function() { return indicator.currentIndex })
            }
        }
    }

    /* Khoi album anh */
    /* Drop shadow */
    Item {
        anchors { fill: parent; leftMargin: wW * 0.1; rightMargin: wW * 0.1 }
        BorderImage {
            id: shadowBorder
            opacity: 0
            asynchronous: true
            smooth: false
            anchors.fill: parent
            anchors { leftMargin: -12; topMargin: -12; rightMargin: -12; bottomMargin: -12 }
            border { left: 10; top: 10; right: 10; bottom: 10 }
            source: "image/shadow.png"
            Behavior on opacity {
                NumberAnimation { duration: 4000 }
            }
        }
        Timer {
            interval: 700
            running: true
            onTriggered: {
                flickArea.y = wH * 0.82
                shadowBorder.opacity = 1
            }
        }
    }
    /* Album anh */
    SwipeView {
        id: swpImg
        anchors.horizontalCenter: parent.horizontalCenter
        anchors { bottom: parent.bottom; bottomMargin: wH * 0.18; top: parent.top }
        width: wW * 0.8
        currentIndex: indicator.currentIndex
        clip: true
        Repeater {
            model: imgList.length
            Image {
                visible: SwipeView.isCurrentItem || SwipeView.isNextItem || SwipeView.isPreviousItem
                asynchronous: true
                source: imgList[index]
                opacity: status == Image.Ready ? 1 : 0
                Behavior on opacity {
                    NumberAnimation { duration: 1000 }
                }
            }
        }
        onCurrentIndexChanged: {
            /* Auto scroll indicator den vi tri anh dang xem */
            if (currentIndex > count - 6) flickArea.contentX = (width / 5) * count - width
            else flickArea.contentX = Math.floor(currentIndex / 5) * width
        }
    }
    /* Thanh hien thi anh thumbnail */
    Flickable {
        id: flickArea
        anchors.horizontalCenter: parent.horizontalCenter
        width: swpImg.width
        height: wH * 0.18
        y: wH
        clip: true
        contentWidth: width / 5 * indicator.count
        Behavior on y {
            NumberAnimation { easing.type: Easing.InSine; duration: 1000 }
        }
        PageIndicator {
            id: indicator
            count: swpImg.count
            currentIndex: swpImg.currentIndex
            interactive: true
            spacing: 0
            padding: 0
            delegate: Image {
                smooth: false
                asynchronous: true
                height: flickArea.height
                width: flickArea.width / 5
                source: imgList[index]
                opacity: index == indicator.currentIndex ? 1 : 0.5
                Rectangle {
                    visible: parent.opacity == 1
                    anchors.fill: parent
                    color: "transparent"
                    border.width: 2
                    border.color: "deepskyblue"
                }
            }
        }
    }
    BtnBackOnly {}
//    Button
//    {
//        id: btnBack
//        width: 0.062 * wW
//        height: 0.042 * wH
//        anchors {top: bg.top; topMargin: 0.013 * wH; right: bg.right; rightMargin: 0.008 * wW}
//        background: Rectangle {
//            anchors.fill: parent
//            radius: 6
//            border.width: 1
//            border.color: "white"
//            color: "#9d803e"
//        }
//        contentItem: Text {
//            text: qsTr("QUAY LẠI")
//            horizontalAlignment: Text.AlignHCenter
//            verticalAlignment: Text.AlignVCenter
//            font.pixelSize: btnBack.height * 0.4
//            color: "white"
//        }
//        onClicked: mainStackView.pop()

//    }


}
