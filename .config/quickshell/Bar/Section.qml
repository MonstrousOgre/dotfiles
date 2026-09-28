import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

import "../"

WrapperRectangle {
    id: root
    color: Colors.sectionBackground
    radius: height / 4
    implicitHeight: parent.height
    leftMargin: 10
    rightMargin: root.leftMargin

    default property alias content: innerLayout.data
    RowLayout {
        id: innerLayout
        spacing: 10
        anchors.verticalCenter: parent.verticalCenter
    }
}
