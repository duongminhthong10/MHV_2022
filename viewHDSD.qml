import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import "Components"
Item {
    Rectangle {
        anchors.fill: parent
        color: "#CCCCCC"
        Component.onCompleted:   {
            PdfProvider.loadFile("D:/MHV_2022_Data/pdf/HDSD.pdf",
                                 wW, wH, 0)
            pdfModel.clear()
            for (var i=0;i<PdfProvider.pageCnt;++i) {
                pdfModel.append({"page": i})
            }
            pdfView.visible = true;
        }
        ListModel {
            id: pdfModel
        }
        Button
        {
            id: btnBack
            width: 0.045 * wW
            height: 0.042 * wH
            anchors {bottom: parent.bottom; bottomMargin: 0.013 * wH; right: parent.right; rightMargin: 0.003 * wW}
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
                font.pixelSize: btnBack.height * 0.36
                color: "white"
            }
            onClicked: mainStackView.pop()

        }
        Rectangle {
            id: pdfView
            visible: false
            width: 0.9 * wW
            //            width: 0.95 * wW
            //        height: 0.95 * wH
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 0.0125 * wH
            anchors.horizontalCenter: parent.horizontalCenter
            //color: "#999999"
            color: "#CCCCCC"
            clip: true
            ListView {
                id: viewpdf
                width: parent.width
                height: parent.height
                topMargin: 0.0125 * wH
                bottomMargin: 0.0125 * wH
                spacing: 0.01 * wH
                model: pdfModel
                delegate: Item {
                    id: content
                    width: 0.9 * wW
                    height: 0.65 * wH
                    anchors.horizontalCenter: parent.horizontalCenter
                    Image {
                        anchors.fill: parent;
                        fillMode: Image.PreserveAspectFit
                        source: "image://pdfpage/" + String(page)
                    }

                }
                ScrollBar.vertical: ScrollBar { width: 20 }
            }
        }


    }

}
