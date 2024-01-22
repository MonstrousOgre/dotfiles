import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
//import Notifications from "resource:///com/github/Aylur/ags/service/notifications.js";
import Mpris from "resource:///com/github/Aylur/ags/service/mpris.js";
import Audio from "resource:///com/github/Aylur/ags/service/audio.js";
import Battery from "resource:///com/github/Aylur/ags/service/battery.js";
import SystemTray from "resource:///com/github/Aylur/ags/service/systemtray.js";
import App from "resource:///com/github/Aylur/ags/app.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";
import { exec, execAsync } from "resource:///com/github/Aylur/ags/utils.js";

const BatteryWidget = () =>
  Widget.Box({
    spacing: 20,
    homogeneous: true,
    visible: Battery.bind("available"),
    className: "vert",
    children: [
      Widget.Box({
        spacing: 20,
        children: [
          Widget.Button({ className: "nohover", child: Widget.Icon({ icon: Battery.bind("icon-name") }) }),
          Widget.ProgressBar({ value: Battery.bind("percent").transform((v) => v / 100) }),
          Widget.Label({ label: Battery.bind("percent").transform((v) => `${v}%`) }),
        ],
      }),
      Widget.Box({
        homogeneous: true,
        children: [
          Widget.Label().hook(
            Battery,
            (self) =>
              (self.label = `${new Date(Battery.timeRemaining * 1000).toISOString().slice(11, 19)} left to ${
                Battery.charging || Battery.charged ? "charge" : "discharge"
              }`),
          ),
        ],
      }),
    ],
  });

export default BatteryWidget;
