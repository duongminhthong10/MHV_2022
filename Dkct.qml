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
                    toaUrl = DataBase.queryTable(tablebuilding,index,"bgUrl")
                    soTang = DataBase.queryTable(tablebuilding,index,"floorActive")
                    TcpClient.selectFloorOn("TC1", "TC0", index)
                    mainStackView.push("viewToaNha.qml")
                    switch (index)
                    {
                    case 0:
                        Uart.writeData("A")
                        break;
                    case 1:
                        Uart.writeData("B")
                        break;
                    case 2:
                        Uart.writeData("C")
                        break;
                    case 3:
                        Uart.writeData("D")
                        break;
                    case 4:
                        Uart.writeData("E")
                        break;
                    case 5:
                        Uart.writeData("F")
                        break;
                    case 6:
                        Uart.writeData("G")
                        break;
                    case 7:
                        Uart.writeData("H")
                        break;
                    case 8:
                        Uart.writeData("I")
                        break;
                    case 9:
                        Uart.writeData("J")
                        break;
                    case 10:
                        Uart.writeData("K")
                        break;
                    case 11:
                        Uart.writeData("L")
                        break;
                    }
                }
            }
        }
    }

    Footer{}
}
