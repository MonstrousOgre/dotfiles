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

const Session = () => {
  const { lock, logout, restart, shutdown } = icons.session;

  return Widget.CenterBox({
    spacing: 20,
    className: "vert",
    startWidget: Widget.Label({
      className: "user",
      label: exec("sh -c 'echo $USER'"),
    }),
    centerWidget: Widget.Label(),
    endWidget: Widget.Box({
      spacing: 40,
      children: [
        Widget.Button({
          child: Widget.Icon(lock),
          onPrimaryClickRelease: () => {
            exec("loginctl lock-session");
          },
        }),
        Widget.Button({
          child: Widget.Icon(logout),
          onPrimaryClickRelease: () => {
            exec("hyprctl dispatch exit");
          },
        }),
        Widget.Button({
          child: Widget.Icon(restart),
          onPrimaryClickRelease: () => {
            exec("systemctl reboot");
          },
        }),
        Widget.Button({
          child: Widget.Icon(shutdown),
          onPrimaryClickRelease: () => {
            exec("systemctl poweroff");
          },
        }),
      ],
    }),
  });
};

export default Session;
