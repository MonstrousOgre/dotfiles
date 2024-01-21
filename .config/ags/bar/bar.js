import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
//import Notifications from "resource:///com/github/Aylur/ags/service/notifications.js";
import Mpris from "resource:///com/github/Aylur/ags/service/mpris.js";
import Audio from "resource:///com/github/Aylur/ags/service/audio.js";
import Battery from "resource:///com/github/Aylur/ags/service/battery.js";
import SystemTray from "resource:///com/github/Aylur/ags/service/systemtray.js";
import App from "resource:///com/github/Aylur/ags/app.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";
import { exec, execAsync } from "resource:///com/github/Aylur/ags/utils.js";

import Workspaces from "./hyprland/workspaces.js";
import Player from "./player.js";
import WindowTitle from "./hyprland/window-title.js";
import Clock from "./clock.js";
import SysTray from "./system-tray.js";

// layout of the bar
const Left = () =>
  Widget.Box({
    spacing: 8,
    children: [Workspaces()],
  });

const Center = () =>
  Widget.Box({
    spacing: 8,
    children: [WindowTitle()],
  });

const Right = () =>
  Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [Player(), Clock(), SysTray()],
  });

const Bar = (monitor = 0) =>
  Widget.Window({
    name: `bar-${monitor}`, // name has to be unique
    class_name: "bar",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  });

export default Bar;
