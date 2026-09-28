import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire
import "../"

Text {
    id: root
    property var sink: Pipewire.defaultAudioSink

    property bool ready: sink && sink.ready

    property real volume: ready ? sink.audio.volume : 0

    color: Colors.foreground

    // Display volume percentage or muted indicator
    text: ready ? (volume * 100).toFixed(0) + "%" : "not ready"

    PwObjectTracker {
        objects: [root.sink]
    }
}
