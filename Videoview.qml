import QtQuick 2.0
import QtMultimedia 5.9
import QtQuick.Controls 2.4
import "Components"
Item {
    Component
    {
        id: component_video
        Video {
            source: "D:/MHV_2022_Data/video/SunshineDiamondRiver.mp4"
            fillMode: VideoOutput.Stretch
            property bool activeStatus: Qt.application.active
            onActiveStatusChanged: {
                if (activeStatus === false) pause(); else play()
            }
        }
    }
    Image {
        source: "video/bg_video.jpg"
        anchors.fill: parent
    }
    Loader {
        id: loader_video
        anchors.fill: parent
        asynchronous: true
        sourceComponent: if (!mainStackView.busy) return component_video
    }
    Timer {
        id: timer
        interval: 2000
        onTriggered: {
            videoControl.visible = false
            videoControl.opacity = 0
            btnBack.visible = false
            btnBack.opacity = 0

        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            videoControl.visible = true
            videoControl.opacity = 1
            btnBack.visible = true
            btnBack.opacity = 1
            timer.restart()
        }
    }
    Item {
        id: videoControl
        anchors.fill: parent
        Behavior on opacity {
            NumberAnimation { duration: 1000 }
        }
        Image {
            source: (loader_video.item.playbackState === MediaPlayer.PlayingState) ?
                        "video/pause_new.png" : "video/play_new.png"
            anchors.centerIn: parent
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (loader_video.item.playbackState !== MediaPlayer.PlayingState) loader_video.item.play()
                    else loader_video.item.pause()
                    timer.restart()
                }
            }
        }
        Slider {
            id: control
            from: 0
            to: loader_video.item.duration
            value: loader_video.item.position
            background: Rectangle {
                x: control.leftPadding
                y: control.topPadding + control.availableHeight / 2 - height / 2
                implicitWidth: 200
                implicitHeight: 10
                width: control.availableWidth
                height: implicitHeight
                radius: 2
                color: "#bdbebf"
                Rectangle {
                    width: control.visualPosition * parent.width
                    height: parent.height
                    color: "#ffc000"
                    radius: 2
                }
            }
            handle: Rectangle {
                x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
                y: control.topPadding + control.availableHeight / 2 - height / 2
                implicitWidth: 8
                implicitHeight: 12
                color: control.pressed ? "#f0f0f0" : "#f6f6f6"
                border.color: "#bdbebf"
            }
            width: wW * 0.7
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: wH * 0.01
            opacity: 0.6
            onMoved: {
                loader_video.item.seek(valueAt(visualPosition))
            }
        }

    }
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
        onClicked: mainStackView.pop()

    }
    Component.onCompleted: {
        music.muted = true
        music.pause()
    }
}
