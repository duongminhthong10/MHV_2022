import QtQuick 2.0
import "Components"
Item {
    Image {
        anchors.fill: parent
        id: bg_main
        source: "image/bg_dkhu.jpg"
    }
    Column
    {
        id: test
        x: x_default * wW
        y : 0.288 * wH
        spacing: 0.04 * wH
        Repeater
        {
            id: huOption
            model: 5
            CustomButton
            {
                checkable: true
                height: 0.0525 * wH
                width: 0.134 * wW

                onClicked: {
                    TcpClient.send("HU0" + (parseInt(index + 1)).toString())
                    for (var i = 0; i <= 4; i++)
                    {
                        if(index === i)
                        {
                            huOption.itemAt(i).checked = true
                            //                            switch (index)
                            //                            {
                            //                            case "0":
                            //                                TcpClient.send("HU01")
                            //                                break;
                            //                            case "1":
                            //                                TcpClient.send("HU02")
                            //                                break;
                            //                            case "2":
                            //                                TcpClient.send("HU03")
                            //                                break;
                            //                            case "3":
                            //                                TcpClient.send("HU04")
                            //                                break;
                            //                            case "4":
                            //                                TcpClient.send("HU05")
                            //                                break;
                            //                            }
                        }
                        else
                        {
                            huOption.itemAt(i).checked = false
                        }
                    }
                }
            }
        }
    }

    Footer{}
}
