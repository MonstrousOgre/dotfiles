import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
//import Notifications from "resource:///com/github/Aylur/ags/service/notifications.js";
import Mpris from "resource:///com/github/Aylur/ags/service/mpris.js";
import Audio from "resource:///com/github/Aylur/ags/service/audio.js";
import Battery from "resource:///com/github/Aylur/ags/service/battery.js";
import Network from "resource:///com/github/Aylur/ags/service/network.js";
import Bluetooth from "resource:///com/github/Aylur/ags/service/bluetooth.js";
import SystemTray from "resource:///com/github/Aylur/ags/service/systemtray.js";
import App from "resource:///com/github/Aylur/ags/app.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";
import { exec, execAsync } from "resource:///com/github/Aylur/ags/utils.js";
import Variable from "resource:///com/github/Aylur/ags/variable.js";

import icons from "../../icons.js";

const BluetoothIndicator = (showDevices) =>
  Widget.Box({
    spacing: 20,
    children: [
      Widget.Button({
        child: Widget.Icon({
          icon: Bluetooth.bind("enabled").transform((v) =>
            v ? icons.bluetooth.enabled : icons.bluetooth.disabled,
          ),
        }),
        onPrimaryClick: () => Bluetooth.toggle(),
      }),
      Widget.Button({
        child: Widget.Label().hook(Bluetooth, (self) => {
          switch (Bluetooth.connectedDevices?.length) {
            case 0:
              self.label = "No devices connected";
              break;
            case 1:
              self.label = Bluetooth.connectedDevices[0].name;
              break;
            default:
              self.label = `${Bluetooth.connectedDevices.length} devices connected`;
          }
        }),
        onPrimaryClick: () => (showDevices.value = !showDevices.value),
      }),
    ],
  });

const NetworkWidget = () => {
  const showDevices = Variable(false);
  return Widget.Box({
    vertical: true,
    children: [
      BluetoothIndicator(showDevices),
      Widget.Revealer({
        revealChild: showDevices.bind(),
        child: Widget.Scrollable({
          css: "min-height: 80px;",
          child: Widget.Box({ className: "devices", vertical: true }).hook(
            Bluetooth,
            (self) => {
              self.children = Bluetooth.devices.map((device) =>
                Widget.Button({
                  child: Widget.Box({
                    children: [
                      Widget.Icon(device.iconName),
                      Widget.Label(device.name),
                    ],
                  }),
                }),
              );
            },
          ),
        }),
      }),
    ],
  });
};

export default NetworkWidget;
