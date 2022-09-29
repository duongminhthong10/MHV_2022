import QtQuick 2.0
import "Components"
Item {
    property int numRoom
    Image {
        anchors.fill: parent
        source: "image/DK_theoTang/" + toaUrl[0] + "/" + tangUrl
    }
    Footer {}
    Item {
        Component.onCompleted: {
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
                numRoom = 4
                // query vao day nhe thong
            }

            /*Xet cac option lua chon phong*/
            switch (toaUrl[0])
            {
            case "A":
                switch (tangMay)
                {
                case "1" :
                case "12":
                case "13":
                    break;
                default:
                    o1.visible = true
                    o2.visible = true
                    o3.visible = true
                    break;
                }
                break;
//            case "B":
//                switch (tangMay)
//                {
//                case "1" :
//                    break
//                case "15":
//                case "16":
//                case "17":
//                case "18":
//                }
            }

        }

        Grid {
            id: fourOptions
            visible: (numRoom == 4) ? true : false
            columns: 1
            rowSpacing: 0.056 * wH
            x: 0.852 * wW
            y: 0.305 * wH
            CustomButton
            {
                id : o1
                visible: false
                width: 0.135 * wW
                height: 0.056 * wH
            }
            CustomButton
            {
                id : o2
                visible: false
                width: 0.135 * wW
                height: 0.056 * wH
            }
            CustomButton
            {
                id : o3
                visible: false
                width: 0.135 * wW
                height: 0.056 * wH
            }
            CustomButton
            {
                id: o4
                visible: false
                width: 0.135 * wW
                height: 0.056 * wH
            }
        }
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
                }
            }
        }
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
                }
            }
        }

    }

}
