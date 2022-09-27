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
        spacing: 0.011 * wW
        Repeater {
            model: 12
            CustomButton
            {
                width: 0.062 * wW
                height: 0.0565 * wH
                onClicked: {

                }
            }
        }
    }

    Footer{}
}
