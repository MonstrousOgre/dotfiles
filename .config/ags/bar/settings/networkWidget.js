import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
//import Notifications from "resource:///com/github/Aylur/ags/service/notifications.js";
import Mpris from "resource:///com/github/Aylur/ags/service/mpris.js";
import Audio from "resource:///com/github/Aylur/ags/service/audio.js";
import Battery from "resource:///com/github/Aylur/ags/service/battery.js";
import Network from "resource:///com/github/Aylur/ags/service/network.js";
import SystemTray from "resource:///com/github/Aylur/ags/service/systemtray.js";
import App from "resource:///com/github/Aylur/ags/app.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";
import { exec, execAsync } from "resource:///com/github/Aylur/ags/utils.js";
import Variable from "resource:///com/github/Aylur/ags/variable.js";

const WifiIndicator = (showNetworks) =>
  Widget.Box({
    spacing: 20,
    children: [
      Widget.Button({
        child: Widget.Icon({
          icon: Network.wifi.bind("icon-name"),
        }),
        onPrimaryClick: () => Network.toggleWifi(),
      }),
      Widget.Button({
        child: Widget.Label({
          label: Network.wifi.bind("ssid"),
        }),
        onPrimaryClick: () => {
          Network.wifi.scan();
          showNetworks.value = !showNetworks.value;
        },
      }),
    ],
  });

const WiredIndicator = (showNetworks) =>
  Widget.Box({
    spacing: 20,
    children: [
      Widget.Button({
        child: Widget.Icon({
          icon: Network.wired.bind("icon-name"),
        }),
      }),
      Widget.Button({
        child: Widget.Label({
          label: "Wired",
        }),
        onPrimaryClick: () => {
          Network.wifi.scan();
          showNetworks.value = !showNetworks.value;
        },
      }),
    ],
  });

const NetworkWidget = () => {
  const showNetworks = Variable(false);
  return Widget.Box({
    vertical: true,
    children: [
      Widget.Stack({
        items: [
          ["wifi", WifiIndicator(showNetworks)],
          ["wired", WiredIndicator(showNetworks)],
        ],
        shown: Network.bind("primary").transform((p) => p || "wifi"),
      }),
      Widget.Revealer({
        revealChild: showNetworks.bind(),
        child: Widget.Scrollable({
          css: "min-height: 80px;",
          child: Widget.Box({ className: "devices", vertical: true }).hook(Network, (self) => {
            self.children = Network.wifi.accessPoints.map((accessPoint) =>
              Widget.Button({
                child: Widget.Box({ children: [Widget.Icon(accessPoint.iconName), Widget.Label(accessPoint.ssid)] }),
              }),
            );
          }),
        }),
      }),
    ],
  });
};

export default NetworkWidget;
