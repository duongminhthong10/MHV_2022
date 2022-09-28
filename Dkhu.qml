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
                    for (var i = 0; i <= 4; i++)
                    {
                        if(index === i)
                        {
                            huOption.itemAt(i).checked = true
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
