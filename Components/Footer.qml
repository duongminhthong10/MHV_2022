import QtQuick 2.0

Item {
    CustomButton
    {
        id: btnBack
        x : x_default * wW
        y: 0.774 * wH
        width: 0.06 * wW
        height: 0.038 * wH
        onClicked: mainStackView.pop(null)
    }
    CustomButton
    {
        id: btnHome
        anchors {top: btnBack.top; left: btnBack.right; leftMargin: 0.012 * wW}
        width: 0.06 * wW
        height: 0.038 * wH
        onClicked: mainStackView.pop()
    }

}
