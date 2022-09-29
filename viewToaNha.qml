import QtQuick 2.0
import "Components"
Item {
    Image {
        id: bg
        anchors.fill: parent
        source: "image/DK_toaNha/" + toaUrl
    }
    Footer {}
    Grid {
        x: x_default * wW
        y: 0.279 * wH
        columns: 5
        flow: Grid.LeftToRight
        columnSpacing: 0.004 * wW
        rowSpacing: 0.0165 * wH
        Repeater {
            model: soTang
            CustomButton {
                width: 0.023 * wW
                height: 0.04 * wH
                onClicked: {
                    tangMay = parseInt(index + 1).toString()
//                    console.log("tang may: " + tangMay)
                    tangUrl = DataBase.queryFindTang(tableFloor,toaUrl[0],(parseInt(index + 1)).toString(),"bgUrl")
                    mainStackView.push("viewTungTang.qml")
                }
            }
        }
    }
}
