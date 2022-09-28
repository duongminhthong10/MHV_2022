import QtQuick 2.0
import "Components"
Item {

    Timer {
        // delay khoi welcome
        interval: 3000
        running: true
        onTriggered:
        {
            welcome.opacity = 0
            menu.opacity = 1
        }
    }

    /*Khoi Welcome*/
    Image {
        id: welcome
        anchors.fill: parent
        source: "image/bg_start.jpg"
        Behavior on opacity {
            NumberAnimation { duration: 1000 }
        }
    }
    /*Khoi Menu*/
    Item {
        id: menu
        anchors.fill: parent
        opacity: 0
        Image {
            anchors.fill: parent
            source: "image/bg_main.jpg"
        }
        Behavior on opacity {
            NumberAnimation { duration: 1000 }
        }
        Column
        {
            x : x_default * wW
            y:  0.274* wH
            spacing: 0.0238 * wH
            Repeater
            {
                anchors.fill: parent
                model: 6
                CustomButton {
                    width: 0.132 * wW
                    height: 0.056 * wH
                    onClicked:
                    {
                        if (index === 5)
                        {                           
                            appwindow.close()
                        }
                        else if (index === 0)
                        {
                            mainStackView.push("Dkct.qml")
                        }
                        else if (index === 1)
                        {
                            mainStackView.push("Dkhu.qml")
                        }
                        else if (index === 2)
                        {                            
                            mainStackView.push("viewDuAn.qml")
                        }
                        else if (index === 3)
                        {
                            mainStackView.push("Videoview.qml")
                        }
                    }
                }
            }
        }
        Footer{}
    }
}
