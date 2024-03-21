import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
//import Notifications from "resource:///com/github/Aylur/ags/service/notifications.js";
import Mpris from "resource:///com/github/Aylur/ags/service/mpris.js";
import Audio from "resource:///com/github/Aylur/ags/service/audio.js";
import Battery from "resource:///com/github/Aylur/ags/service/battery.js";
import SystemTray from "resource:///com/github/Aylur/ags/service/systemtray.js";
import App from "resource:///com/github/Aylur/ags/app.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";
import { exec, execAsync } from "resource:///com/github/Aylur/ags/utils.js";
import icons from "../../icons.js";

import Session from "./session.js";
import BatteryWidget from "./batteryWidget.js";
import AudioInput from "./audio/audioInput.js";
import AudioOutput from "./audio/audioOutput.js";
import NetworkWidget from "./networkWidget.js";
// import BluetoothWidget from "./bluetoothWidget.js";

const Row = (children) =>
  Widget.Box({
    spacing: 20,
    className: "vert",
    homogeneous: true,
    // css: "padding: 10px; min-width: 350px;",
    children: children,
  });

const Settings = (monitor = 0) =>
  Widget.Window({
    name: `settings-${monitor}`, // name has to be unique
    visible: false,
    popup: true,
    exclusivity: "exclusive",
    class_name: "bar settings",
    monitor,
    anchor: ["top", "right"],
    child: Widget.Box({
      spacing: 4,
      vertical: true,
      className: "box",
      children: [
        Session(),
        Row([AudioOutput(), AudioInput()]),
        BatteryWidget(),
        // Row([NetworkWidget(), BluetoothWidget()]),
        Row([NetworkWidget()]),
      ],
    }),
  });

export default Settings;
