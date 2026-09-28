import QtQuick
import QtQuick.Layouts
import Quickshell

import "../"
import "../Items"

PanelWindow {
    id: barWindow
    required property var modelData
    screen: modelData

    margins {
        left: 20
        right: barWindow.margins.left
        top: 1
    }

    // Position at the top of each monitor
    anchors {
        top: true
        left: true
        right: true
    }
    implicitHeight: 34

    color: Colors.background

    // RowLayout {
    //
    //     implicitHeight: parent.height
    //
    //     Section {
    //         Workspaces {}
    //     }
    //
    //     Section {}
    // }

    Section {
        Workspaces {}
    }

    Section {
        anchors.centerIn: parent
        WindowTitle {}
    }

    Section {
        anchors.right: parent.right
        Tray {}
        Audio {}
        Clock {}
    }
}
