import QtQuick
import QtQuick.Layouts
import Quickshell

import "../"

BasePopup {
    id: root

    readonly property real cellSize: 36
    readonly property real cellHeight: 32
    readonly property real margins: 16

    // Live Date Tracking
    property date today: new Date()
    property int displayYear: today.getFullYear()
    property int displayMonth: today.getMonth() // 0 - 11

    // Refresh "today" whenever the popup is opened
    onVisibleChanged: {
        if (visible) {
            root.today = new Date();
            root.displayYear = root.today.getFullYear();
            root.displayMonth = root.today.getMonth();
        }
    }

    function daysInMonth(year, month) {
        return new Date(year, month + 1, 0).getDate();
    }

    function startDayOfWeek(year, month) {
        return new Date(year, month, 1).getDay();
    }

    grabFocus: true

    // --- Header: Month/Year & Navigation ---
    RowLayout {
        Layout.fillWidth: true

        Text {
            text: "<"
            color: Colors.foreground
            font.bold: true
            font.pixelSize: 14
            Layout.alignment: Qt.AlignVCenter

            MouseArea {
                anchors.fill: parent
                anchors.margins: -8
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    if (root.displayMonth === 0) {
                        root.displayMonth = 11;
                        root.displayYear--;
                    } else {
                        root.displayMonth--;
                    }
                }
            }
        }

        Text {
            text: Qt.formatDate(new Date(root.displayYear, root.displayMonth, 1), "MMMM yyyy")
            color: Colors.foreground
            font.bold: true
            font.pixelSize: 15
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            text: ">"
            color: Colors.foreground
            font.bold: true
            font.pixelSize: 14
            Layout.alignment: Qt.AlignVCenter

            MouseArea {
                anchors.fill: parent
                anchors.margins: -8
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    if (root.displayMonth === 11) {
                        root.displayMonth = 0;
                        root.displayYear++;
                    } else {
                        root.displayMonth++;
                    }
                }
            }
        }
    }

    // --- Days of Week Header ---
    Grid {
        columns: 7
        Layout.fillWidth: true

        Repeater {
            model: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
            Text {
                width: root.cellSize
                height: 24
                text: modelData
                color: Colors.foreground
                font.pixelSize: 12
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    // --- Month Grid ---
    Grid {
        columns: 7
        Layout.fillWidth: true

        // Blank slots before day 1
        Repeater {
            model: root.startDayOfWeek(root.displayYear, root.displayMonth)
            Item {
                width: root.cellSize
                height: root.cellHeight
            }
        }

        // Days of month
        Repeater {
            model: root.daysInMonth(root.displayYear, root.displayMonth)

            Rectangle {
                width: root.cellSize
                height: root.cellHeight
                radius: 6

                readonly property int dayNumber: index + 1
                readonly property bool isToday: {
                    return root.today.getDate() === dayNumber && root.today.getMonth() === root.displayMonth && root.today.getFullYear() === root.displayYear;
                }

                color: isToday ? Colors.accent : "transparent"

                Text {
                    anchors.centerIn: parent
                    text: dayNumber
                    color: isToday ? Colors.sectionBackground : Colors.foreground
                    font.bold: isToday
                    font.pixelSize: 12
                }
            }
        }
    }
}
