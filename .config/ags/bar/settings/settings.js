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

import AudioWidget from "./audio.js";

const Settings = (monitor = 0) =>
  Widget.Window({
    name: `settings-${monitor}`, // name has to be unique
    visible: false,
    popup: true,
    exclusive: false,
    class_name: "bar settings",
    monitor,
    anchor: ["top", "right"],
    child: Widget.Box({
      spacing: 4,
      vertical: true,
      css: "padding: 10px;",
      children: [AudioWidget()],
    }),
  });

export default Settings;
