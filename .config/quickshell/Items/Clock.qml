import QtQuick
import Quickshell

import "../"
import "../Popups"

Item {
    id: root

    implicitWidth: clockText.implicitWidth
    implicitHeight: clockText.implicitHeight

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

    Text {
        id: clockText
        text: Qt.formatDateTime(clock.date, "hh:mm:ss")
        color: Colors.foreground
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: calendarPopup.visible = !calendarPopup.visible
    }

    Calendar {
        id: calendarPopup

        anchor.item: root
        anchor.edges: Edges.Bottom | Edges.Right
        anchor.gravity: Edges.Bottom | Edges.Left

        visible: false
    }
}
