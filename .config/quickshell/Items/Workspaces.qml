import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

import "../"

Repeater {
    model: Hyprland.workspaces

    Rectangle {
        required property var modelData
        width: 10
        height: 10
        color: modelData.focused ? Colors.accent : (modelData.active ? Colors.active : Colors.inactive)

        border {
            color: Colors.workspaceBorder
            width: 1
        }

        MouseArea {
            anchors.fill: parent
            onClicked: modelData.activate()
        }
    }
}
