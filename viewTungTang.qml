import QtQuick 2.0
import "Components"
Item {
    property int numRoom
    property string numRoomActive
    property string nut1
    property string nut2
    property string nut3
    property string nut4
    Component.onCompleted: {
        nut1 = DataBase.queryFindTang(tableFloor,toaUrl[0],tangMay,"o1").toString()
        nut2 = DataBase.queryFindTang(tableFloor,toaUrl[0],tangMay,"o2").toString()
        nut3 = DataBase.queryFindTang(tableFloor,toaUrl[0],tangMay,"o3").toString()
        nut4 = DataBase.queryFindTang(tableFloor,toaUrl[0],tangMay,"o4").toString()
        console.log("toa: " + toaUrl[0])
        console.log("tang: " + tangMay)
        if ((toaUrl[0] === "C" || toaUrl[0] === "G" || toaUrl[0] === "K") && ((tangMay === "36") || (tangMay === "37")))
        {
            numRoom = 8
        }
        else if (((toaUrl[0] === "J") && (tangMay === "15" || tangMay === "16")) || ((toaUrl[0] === "L") && (tangMay === "33" || tangMay === "34")))
        {
            numRoom = 5
        }
        else {
            /*opacity = 0 la tat*/
            //            console.log(nut1)
            numRoom = 4
            numRoomActive = DataBase.queryFindTang(tableFloor,toaUrl[0],tangMay,"group").toString();
            console.log("numRoomActive: " + numRoomActive)
            switch (numRoomActive) {
            case "1_3":
                o4.opacity = 0
                console.log("mot den ba")
                break;
            case "2_3":
                o1.opacity = 0
                o4.opacity = 0
                break;
            case "null":
                o1.opacity = 0
                o2.opacity = 0
                o3.opacity = 0
                o4.opacity = 0
                break;
            case "2_4":
                o1.opacity = 0
                console.log("hai den bon")
                break;
            case "3_4":
                o1.opacity = 0
                o2.visible = 0
                break;
            case "4":
                o1.opacity = 0
                o2.opacity = 0
                o3.opacity = 0
                break;
            case "1_2#4":
                o3.opacity = 0
                break;
            case "2#4":
                o1.opacity = 0
                o3.opacity = 0
                break;
            case "2":
                o1.opacity = 0
                o3.opacity = 0
                o4.opacity = 0
                break;
            default:
                break;
            }
            // query vao day nhe thong
            /*view cac phong bang hinh anh*/
        }
    }
    Image {
        anchors.fill: parent
        source: "image/DK_theoTang/" + toaUrl[0] + "/" + tangUrl
    }
    //    Footer {}
    Item {
        CustomButton
        {
            id: btnBack
            x : x_default * wW
            y: 0.774 * wH
            width: 0.06 * wW
            height: 0.038 * wH
            onClicked:
            {
                //                TcpClient.send("TC1")
                TcpClient.sendOnly(option,"TC1")
                Uart.writeData(toaUrl[0])
                mainStackView.pop()
            }
        }
        CustomButton
        {
            id: btnHome
            anchors {top: btnBack.top; left: btnBack.right; leftMargin: 0.012 * wW}
            width: 0.06 * wW
            height: 0.038 * wH
            onClicked:
            {
                mainStackView.pop(null)
            }
        }
    }
    Item {
        Column {
            id: fourOptions
            visible: (numRoom == 4) ? true : false
            spacing: 0.056 * wH
            x: 0.852 * wW
            y: 0.305 * wH
            CustomButton
            {
                id : o1
                width: 0.135 * wW
                height: 0.056 * wH
                onClicked: {
                    switch (nut1) {
                    case "1N":
                        mainStackView.push("viewPhongNgu1.qml")
                        break;
                    case "2N":
                        mainStackView.push("viewPhongNgu2.qml")
                        break;
                    case "LN" :
                        console.log("phong lanh nan")
                        break;
                    case "3N":
                        mainStackView.push("viewPhongNgu3.qml")
                        break;
                    case "null":
                        break;
                    }

                }
            }
            CustomButton
            {
                id : o2
                width: 0.135 * wW
                height: 0.056 * wH
                onClicked: {
                    switch (nut2) {
                    case "2N":
                        mainStackView.push("viewPhongNgu2.qml")
                        break;
                    case "3N":
                        mainStackView.push("viewPhongNgu3.qml")
                        break;
                    case "4N":
                        mainStackView.push("viewPhongNgu4.qml")
                        break;
                    case "D3":
                        console.log("phong Duplex d3")
                        break;
                    case "D31":
                        console.log("phong Duplex d31")
                        break;
                    case "null":
                        break;
                    }

                }
            }
            CustomButton
            {
                id : o3
                width: 0.135 * wW
                height: 0.056 * wH
                onClicked: {
                    switch(nut3)
                    {
                    case "3N":
                        mainStackView.push("viewPhongNgu3.qml")
                        break;
                    case "D3":
                        console.log("phong Duplex d3")
                        break;
                    case "D4":
                        console.log("phong Duplex d4")
                        break;
                    case "TI":
                        console.log("phong TI")
                        break;
                    case "SV":
                        console.log("phong SV")
                        break;
                    case "D2":
                        console.log("phong Duplex 2")
                        break;
                    case "D41":
                        console.log("phong Duplex 41")
                        break;
                    case "D32":
                        console.log("phong Duplex 32")
                        break;
                    case "4N":
                        mainStackView.push("viewPhongNgu4.qml")
                        break;
                    case "null":
                        break;
                    }
                }

            }

            CustomButton
            {
                id: o4
                width: 0.135 * wW
                height: 0.056 * wH
                onClicked:
                {
                    switch(nut4)
                    {
                    case "D3":
                        console.log("phong Duplex d3")
                        break;
                    case "D4":
                        console.log("phong Duplex d4")
                        break;
                    case "TI":
                        console.log("phong TI")
                        break;
                    case "D5":
                        console.log("phong Duplex d5")
                        break;
                    case "D6":
                        console.log("phong Duplex d6")
                        break;
                    case "4N":
                        mainStackView.push("viewPhongNgu4.qml")
                        break;
                    case "D42":
                        console.log("phong Duplex d42")
                        break;
                    case "LN":
                        console.log("phong lanh nan")
                        break;
                    case "D":
                        mainStackView.push("viewDuplex.qml")
                        break;
                    case "null":
                        break;
                    }
                }



            }
        }
        // de cu the ma onClick
        Grid {
            id: eightOptions
            visible: (numRoom == 8) ? true : false
            columns: 2
            columnSpacing: 0.013 *wW
            rowSpacing: 0.058 * wH
            x: 0.852 * wW
            y: 0.305 * wH
            Repeater
            {
                model: 8
                CustomButton {
                    width: 0.061 * wW
                    height: 0.055 * wH
                    onClicked: {
                        switch (parseInt(index+1).toString())
                        {
                        case "1":
                            console.log("phong duplex 31")
                            break;
                        case "2":
                            console.log("phong duplex 32")
                            break;
                        case "3":
                            console.log("phong duplex 33")
                            break;
                        case "4":
                            console.log("phong duplex 34")
                            break;
                        case "5":
                            console.log("phong duplex 41")
                            break;
                        case "6":
                            console.log("phong duplex 42")
                            break;
                        case "7":
                            console.log("phong duplex 43")
                            break;
                        case "8":
                            console.log("phong duplex 44")
                            break;
                        }

                    }
                }
            }
        }
        // de cu the ma onClick
        Grid {
            id: fiveOptions
            visible: (numRoom == 5) ? true : false
            columns: 1
            rowSpacing: 0.03 * wH
            x: 0.851 * wW
            y: 0.3 * wH
            Repeater
            {
                model: 5
                CustomButton {
                    width: 0.135 * wW
                    height: 0.056 * wH
                    onClicked:
                    {
                        if (toaUrl[0] === "J") {
                            switch (parseInt(index+1).toString())
                            {
                            case "1":
                                mainStackView.push("viewPhongNgu1.qml")
                                break;
                            case "2":
                                mainStackView.push("viewPhongNgu2.qml")
                                break;
                            case "3":
                                mainStackView.push("viewPhongNgu3.qml")
                                break;
                            case "4":
                                console.log("phong duplex 3")
                                break;
                            case "5":
                                console.log("phong duplex 4")
                                break;
                            }
                        }
                        else
                        {
                            switch (parseInt(index+1).toString())
                            {
                            case "1":
                                mainStackView.push("viewPhongNgu2.qml")
                                break;
                            case "2":
                                mainStackView.push("viewPhongNgu3.qml")
                                break;
                            case "3":
                                mainStackView.push("viewPhongNgu4.qml")
                                break;
                            case "4":
                                console.log("phong duplex 3")
                                break;
                            case "5":
                                console.log("phong duplex 4")
                                break;
                            }
                        }
                    }
                }
            }
        }

    }

}

