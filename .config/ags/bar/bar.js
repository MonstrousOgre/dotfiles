import App from "resource:///com/github/Aylur/ags/app.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";

import Workspaces from "./hyprland/workspaces.js";
import Player from "./player.js";
import WindowTitle from "./hyprland/window-title.js";
import Clock from "./clock.js";
import SysTray from "./system-tray.js";
import Toggler from "./toggler.js";
import IdleInhibitor from "./idleInhibitor.js";

// layout of the bar
const Left = (monitor = 0) =>
  Widget.Box({
    spacing: 8,
    children: [Workspaces()],
  });

const Center = (monitor = 0) =>
  Widget.Box({
    spacing: 8,
    children: [WindowTitle()],
  });

const Right = (monitor = 0) =>
  Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [
      Player(),
      Clock(),
      IdleInhibitor(),
      SysTray(),
      Toggler(() => {
        App.toggleWindow(`settings-${monitor}`);
      }),
    ],
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
      end_widget: Right(monitor),
    }),
  });

export default Bar;
