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
                o2.opacity = 0
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
        source: "file:///D:/MHV_2022_Data/image/DK_theoTang/" + toaUrl[0] + "/" + tangUrl
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
                    imgList.length = 0
                    switch (nut1) {
                    case "1N":
                        room = "1PN"
                        for (var i = 0; i < DataBase.queryNoiThat("tblNoiThat","1PN"); i++)
                        {
                            imgList[i] = "file:///D:/MHV_2022_Data/NoiThat/1PN/" + parseInt(i+1) + ".jpg"
                        }
                        mainStackView.push("viewPhongNgu1.qml")
                        break;
                    case "2N":
                        room = "2PN"
                        for (var j = 0; j < DataBase.queryNoiThat("tblNoiThat","2PN"); j++)
                        {
                            imgList[j] = "file:///D:/MHV_2022_Data/NoiThat/2PN/" + parseInt(j+1) + ".jpg"
                        }
                        mainStackView.push("viewPhongNgu2.qml")
                        break;
                    case "LN" :
                        room = "LN"
//                        for (var c = 0; c < DataBase.queryNoiThat("tblNoiThat","LN"); c++)
//                        {
//                            imgList[c] = "file:///D:/MHV_2022_Data/NoiThat/LN/" + parseInt(c+1) + ".jpg"
//                        }
                        //mainStackView.push("viewPhongLN.qml")
                        console.log("phong lanh nan")
                        console.log(DataBase.queryCacLoaiPhong(tableCong,toaUrl[0],tangMay,room,"mapCongArray"))
                        TcpClient.sendOnly(option, "DKTC_" + DataBase.queryCacLoaiPhong(tableCong,toaUrl[0],tangMay,room,"mapCongArray"))
                        break;
                    case "3N":
                        room = "3PN"
                        for (var k = 0; k < DataBase.queryNoiThat("tblNoiThat","3PN"); k++)
                        {
                            imgList[k] = "file:///D:/MHV_2022_Data/NoiThat/3PN/" + parseInt(k+1) + ".jpg"
                        }
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
                    imgList.length = 0
                    switch (nut2) {
                    case "2N":
                        room = "2PN"
                        for (var j = 0; j < DataBase.queryNoiThat("tblNoiThat","2PN"); j++)
                        {
                            imgList[j] = "file:///D:/MHV_2022_Data/NoiThat/2PN/" + parseInt(j+1) + ".jpg"
                        }
                        mainStackView.push("viewPhongNgu2.qml")
                        break;
                    case "3N":
                        room = "3PN"
                        for (var k = 0; k < DataBase.queryNoiThat("tblNoiThat","3PN"); k++)
                        {
                            imgList[k] = "file:///D:/MHV_2022_Data/NoiThat/3PN/" + parseInt(k+1) + ".jpg"
                        }
                        mainStackView.push("viewPhongNgu3.qml")
                        break;
                    case "4N":
                        room = "4PN"
                        for (var a = 0; a < DataBase.queryNoiThat("tblNoiThat","4PN"); a++)
                        {
                            imgList[a] = "file:///D:/MHV_2022_Data/NoiThat/4PN/" + parseInt(a+1) + ".jpg"
                        }
                        mainStackView.push("viewPhongNgu4.qml")
                        break;
                    case "D3":
                        room = "DL3PN"
                        console.log("phong Duplex d3")
                        for (var b31 = 0; b31 < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b31++)
                        {
                            imgList[b31] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b31+1) + ".jpg"
                        }
                        mainStackView.push("viewDuplex.qml")
                        break;
                    case "D31":
                        room = "DL3PN-1"
                        console.log("phong Duplex d31")
                        for (var b32 = 0; b32 < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b32++)
                        {
                            imgList[b32] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b32+1) + ".jpg"
                        }
                        mainStackView.push("viewDuplex.qml")
                        break;
                    case "D":
                        for (var b3 = 0; b3 < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b3++)
                        {
                            imgList[b3] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b3+1) + ".jpg"
                        }
                        mainStackView.push("viewDuplex.qml")
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
                    imgList.length = 0
                    switch(nut3)
                    {
                    case "3N":
                        room = "3PN"
                        for (var k = 0; k < DataBase.queryNoiThat("tblNoiThat","3PN"); k++)
                        {
                            imgList[k] = "file:///D:/MHV_2022_Data/NoiThat/3PN/" + parseInt(k+1) + ".jpg"
                        }
                        mainStackView.push("viewPhongNgu3.qml")
                        break;
                    case "D3":
                        room = "DL3PN"
                        console.log("phong Duplex d3")
                        for (var b31 = 0; b31 < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b31++)
                        {
                            imgList[b31] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b31+1) + ".jpg"
                        }
                        mainStackView.push("viewDuplex.qml")
                        break;
                    case "D4":
                        room = "DL4PN"
                        for (var b32 = 0; b32 < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b32++)
                        {
                            imgList[b32] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b32+1) + ".jpg"
                        }
                        mainStackView.push("viewDuplex.qml")
                        console.log("phong Duplex d4")
                        break;
                    case "TI":
                        console.log("phong TI")
                        break;
                    case "SV":
                        console.log("phong SV")
                        break;
                    case "D2":
                        room = "DL2PN"
                        console.log("phong Duplex 2")
                        for (var b33 = 0; b33 < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b33++)
                        {
                            imgList[b33] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b33+1) + ".jpg"
                        }
                        mainStackView.push("viewDuplex.qml")
                        break;
                    case "D41":
                        room = "DL4PN-1"
                        console.log("phong Duplex 41")
                        for (var b34 = 0; b34 < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b34++)
                        {
                            imgList[b34] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b34+1) + ".jpg"
                        }
                        mainStackView.push("viewDuplex.qml")
                        break;
                    case "D32":
                        room = "DL3PN-2"
                        console.log("phong Duplex 32")
                        for (var b35 = 0; b35 < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b35++)
                        {
                            imgList[b35] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b35+1) + ".jpg"
                        }
                        mainStackView.push("viewDuplex.qml")
                        break;
                    case "4N":
                        room = "4PN"
                        for (var a = 0; a < DataBase.queryNoiThat("tblNoiThat","4PN"); a++)
                        {
                            imgList[a] = "file:///D:/MHV_2022_Data/NoiThat/4PN/" + parseInt(a+1) + ".jpg"
                        }
                        mainStackView.push("viewPhongNgu4.qml")
                        break;
                    case "D":
                        for (var b3 = 0; b3 < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b3++)
                        {
                            imgList[b3] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b3+1) + ".jpg"
                        }
                        mainStackView.push("viewDuplex.qml")
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
                    imgList.length = 0
                    switch(nut4)
                    {
                    case "D3":
                        room = "DL3PN"
                        console.log("phong Duplex d3")
                        for (var b1 = 0; b1 < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b1++)
                        {
                            imgList[b1] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b1+1) + ".jpg"
                        }
                        mainStackView.push("viewDuplex.qml")
                        break;
                    case "D4":
                        room = "DL4PN"
                        console.log("phong Duplex d4")
                        for (var b2 = 0; b2 < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b2++)
                        {
                            imgList[b2] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b2+1) + ".jpg"
                        }
                        mainStackView.push("viewDuplex.qml")
                        break;
                    case "TI":
                        console.log("phong TI")
                        break;
                    case "D5":
                        room = "DL5PN"
                        for (var b3 = 0; b3 < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b3++)
                        {
                            imgList[b3] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b3+1) + ".jpg"
                        }
                        mainStackView.push("viewDuplex.qml")
                        console.log("phong Duplex d5")
                        break;
                    case "D6":
                        console.log("phong Duplex d6")
                        break;
                    case "4N":
                        room = "4PN"
                        for (var a = 0; a < DataBase.queryNoiThat("tblNoiThat","4PN"); a++)
                        {
                            imgList[a] = "file:///D:/MHV_2022_Data/NoiThat/4PN/" + parseInt(a+1) + ".jpg"
                        }
                        mainStackView.push("viewPhongNgu4.qml")
                        break;
                    case "D42":
                        room = "DL4PN-2"
                        for (var b4 = 0; b4 < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b4++)
                        {
                            imgList[b4] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b4+1) + ".jpg"
                        }
                        mainStackView.push("viewDuplex.qml")
                        console.log("phong Duplex d42")
                        break;
                    case "LN":
                        room = "LN"
//                        for (var c = 0; c < DataBase.queryNoiThat("tblNoiThat","LN"); c++)
//                        {
//                            imgList[c] = "file:///D:/MHV_2022_Data/NoiThat/LN/" + parseInt(c+1) + ".jpg"
//                        }
                        console.log("phong lanh nan")
                        console.log(DataBase.queryCacLoaiPhong(tableCong,toaUrl[0],tangMay,room,"mapCongArray"))
                        TcpClient.sendOnly(option, "DKTC_" + DataBase.queryCacLoaiPhong(tableCong,toaUrl[0],tangMay,room,"mapCongArray"))
                        //mainStackView.push("viewPhongLN.qml")
                        break;
                    case "D":
                        for (var b = 0; b < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b++)
                        {
                            imgList[b] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b+1) + ".jpg"
                        }
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
                            room = "DL3PN-1"
                            console.log("phong duplex 31")
                            break;
                        case "2":
                            room = "DL3PN-2"
                            console.log("phong duplex 32")
                            break;
                        case "3":
                            room = "DL3PN-3"
                            console.log("phong duplex 33")
                            break;
                        case "4":
                            room = "DL3PN-4"
                            console.log("phong duplex 34")
                            break;
                        case "5":
                            room = "DL4PN-1"
                            console.log("phong duplex 41")
                            break;
                        case "6":
                            room = "DL4PN-2"
                            console.log("phong duplex 42")
                            break;
                        case "7":
                            room = "DL4PN-3"
                            console.log("phong duplex 43")
                            break;
                        case "8":
                            room = "DL4PN-4"
                            console.log("phong duplex 44")
                            break;
                        }
                        for (var b = 0; b < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b++)
                        {
                            imgList[b] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b+1) + ".jpg"
                        }
                        mainStackView.push("viewDuplex.qml")

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
                        imgList.length = 0
                        if (toaUrl[0] === "J") {
                            switch (parseInt(index+1).toString())
                            {
                            case "1":
                                room = "1PN"
                                for (var i = 0; i < 13; i++)
                                {
                                    imgList[i] = "file:///D:/MHV_2022_Data/NoiThat/1PN/" + parseInt(i+1) + ".jpg"
                                }
                                mainStackView.push("viewPhongNgu1.qml")
                                break;
                            case "2":
                                room = "2PN"
                                for (var j = 0; j < DataBase.queryNoiThat("tblNoiThat","2PN"); j++)
                                {
                                    imgList[j] = "file:///D:/MHV_2022_Data/NoiThat/2PN/" + parseInt(j+1) + ".jpg"
                                }
                                mainStackView.push("viewPhongNgu2.qml")
                                break;
                            case "3":
                                room = "3PN"
                                for (var k = 0; k < DataBase.queryNoiThat("tblNoiThat","3PN"); k++)
                                {
                                    imgList[k] = "file:///D:/MHV_2022_Data/NoiThat/3PN/" + parseInt(k+1) + ".jpg"
                                }
                                mainStackView.push("viewPhongNgu3.qml")
                                break;
                            case "4":
                                room = "DL3PN"
//                                console.log("phong duplex 3")
                                for (var b = 0; b < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b++)
                                {
                                    imgList[b] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b+1) + ".jpg"
                                }
                                mainStackView.push("viewDuplex.qml")
                                break;
                            case "5":
                                room = "DL4PN"
                                for (var b1 = 0; b1 < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b1++)
                                {
                                    imgList[b1] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b1+1) + ".jpg"
                                }
//                                console.log("phong duplex 4")
                                mainStackView.push("viewDuplex.qml")
                                break;
                            }
                        }
                        else
                        {
                            switch (parseInt(index+1).toString())
                            {
                            case "1":
                                room = "2PN"
                                for (var j1 = 0; j1 < DataBase.queryNoiThat("tblNoiThat","2PN"); j1++)
                                {
                                    imgList[j1] = "file:///D:/MHV_2022_Data/NoiThat/2PN/" + parseInt(j1+1) + ".jpg"
                                }
                                mainStackView.push("viewPhongNgu2.qml")
                                break;
                            case "2":
                                room = "3PN"
                                for (var k1 = 0; k1 < DataBase.queryNoiThat("tblNoiThat","3PN"); k1++)
                                {
                                    imgList[k1] = "file:///D:/MHV_2022_Data/NoiThat/3PN/" + parseInt(k1+1) + ".jpg"
                                }
                                mainStackView.push("viewPhongNgu3.qml")
                                break;
                            case "3":
                                room = "4PN"
                                for (var a = 0; a < DataBase.queryNoiThat("tblNoiThat","4PN"); a++)
                                {
                                    imgList[a] = "file:///D:/MHV_2022_Data/NoiThat/4PN/" + parseInt(a+1) + ".jpg"
                                }
                                mainStackView.push("viewPhongNgu4.qml")
                                break;
                            case "4":
                                room = "DL3PN"
                                for (var b2 = 0; b2 < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b2++)
                                {
                                    imgList[b2] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b2+1) + ".jpg"
                                }
                                mainStackView.push("viewDuplex.qml")
//                                console.log("phong duplex 3")
                                break;
                            case "5":
                                room = "DL4PN"
                                for (var b3 = 0; b3 < DataBase.queryNoiThat("tblNoiThat","DUPLEX"); b3++)
                                {
                                    imgList[b3] = "file:///D:/MHV_2022_Data/NoiThat/DUPLEX/" + parseInt(b3+1) + ".jpg"
                                }
                                mainStackView.push("viewDuplex.qml")
//                                console.log("phong duplex 4")
                                break;
                            }
                        }
                    }
                }
            }
        }

    }

}

