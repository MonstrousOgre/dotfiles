import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
//import Notifications from "resource:///com/github/Aylur/ags/service/notifications.js";
import Mpris from "resource:///com/github/Aylur/ags/service/mpris.js";
import Audio from "resource:///com/github/Aylur/ags/service/audio.js";
import Battery from "resource:///com/github/Aylur/ags/service/battery.js";
import SystemTray from "resource:///com/github/Aylur/ags/service/systemtray.js";
import App from "resource:///com/github/Aylur/ags/app.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";
import { exec, execAsync } from "resource:///com/github/Aylur/ags/utils.js";
import Variable from "resource:///com/github/Aylur/ags/variable.js";

import icons from "../../icons.js";

import Toggler from "../toggler.js";

const Devices = () =>
  Widget.Box({ className: "devices", vertical: true }).hook(Audio, (self) => {
    if (Audio.microphones) {
      self.children = Audio.microphones.map((microphone) =>
        Widget.Button({
          className: `${Audio.microphone.id === microphone.id ? "selected" : ""}`,
          child: Widget.Label(microphone.description),
          onPrimaryClick: () => {
            Audio.microphone = microphone;
          },
        }),
      );
    }
  });

const AudioInput = () => {
  const { muted, mic } = icons.mic;

  const showDevices = Variable(false);
  return Widget.Box({
    vertical: true,
    children: [
      Widget.Box({
        spacing: 8,
        css: "min-width: 180px;",
        children: [
          Widget.Button({
            child: Widget.Icon(icons.volume.medium).hook(Audio, (self) => {
              if (Audio.microphone?.stream) {
                self.icon = Audio.microphone.stream.isMuted ? muted : mic;
              }
            }),
            onPrimaryClick: () => {
              Audio.microphone.stream.isMuted = !Audio.microphone.stream.isMuted;
            },
          }),
          Widget.Slider({
            hexpand: true,
            drawValue: false,
            onChange: ({ value }) => (Audio.microphone.volume = value),
            setup: (self) =>
              self.hook(
                Audio,
                () => {
                  self.value = Audio.microphone?.volume || 0;
                },
                "microphone-changed",
              ),
          }),
          Toggler(() => {
            showDevices.value = !showDevices.value;
          }),
        ],
      }),
      Widget.Revealer({ revealChild: showDevices.bind(), child: Devices() }),
    ],
  });
};
export default AudioInput;
