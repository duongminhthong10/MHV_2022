import QtQuick 2.0
import "Components"
Item {
    Image {
        anchors.fill: parent
        id: bg_main
        source: "image/bg_dkct.jpg"
    }
    /*Menu option*/
    Grid
    {
        id: menuOption
        x: x_default * wW
        y: 0.287 * wH
        columns: 2
        columnSpacing: 0.011 * wW
        rowSpacing: 0.0176 * wH
        flow: Grid.TopToBottom
        Repeater {
            model: 12
            CustomButton
            {
                width: 0.062 * wW
                height: 0.0565 * wH
                onClicked: {
                    toa = DataBase.queryTable(tablebuilding,index,"bgUrl")
                    soTang = DataBase.queryTable(tablebuilding,index,"floorActive")
                    mainStackView.push("viewToaNha.qml")
                }
            }
        }
    }

    Footer{}
}
