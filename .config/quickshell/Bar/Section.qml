import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

import "../"

WrapperRectangle {
    id: root
    color: Colors.sectionBackground
    radius: height / 2
    implicitHeight: parent.height
    leftMargin: 15
    rightMargin: root.leftMargin

    border.color: Colors.popupBorder
    // border.width: 1

    default property alias content: innerLayout.data
    RowLayout {
        id: innerLayout
        spacing: 10
        anchors.verticalCenter: parent.verticalCenter
    }
}
