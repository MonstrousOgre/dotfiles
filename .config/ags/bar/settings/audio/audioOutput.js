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

import icons from "../../../icons.js";

import Toggler from "../../toggler.js";

const Devices = () =>
  Widget.Box({ className: "devices", vertical: true }).hook(Audio, (self) => {
    if (Audio.speakers) {
      self.children = Audio.speakers.map((speaker) =>
        Widget.Button({
          className: `${Audio.speaker.id === speaker.id ? "selected" : ""}`,
          child: Widget.Label(speaker.description),
          onPrimaryClick: () => {
            Audio.speaker = speaker;
          },
        }),
      );
    }
  });

const AudioOutput = () => {
  const { muted, low, high, medium, overamplified } = icons.volume;

  const showDevices = Variable(false);
  return Widget.Box({
    vertical: true,
    children: [
      Widget.Box({
        children: [
          Widget.Button({
            child: Widget.Icon(icons.volume.medium).hook(Audio, (self) => {
              if (Audio.speaker?.stream) {
                if (Audio.speaker.stream.isMuted) {
                  self.icon = muted;
                } else {
                  const cons = [
                    [101, overamplified],
                    [67, high],
                    [34, medium],
                    [0, low],
                  ];
                  self.icon =
                    cons.find(([n]) => n <= Audio.speaker.volume * 100)?.[1] ||
                    "";
                }
              }
            }),
            onPrimaryClick: () => {
              execAsync("pactl set-sink-mute @DEFAULT_SINK@ toggle");
              // Audio.speaker.stream.isMuted = !Audio.speaker.stream.isMuted;
            },
          }),
          Widget.Slider({
            hexpand: true,
            drawValue: false,
            onChange: ({ value }) => (Audio.speaker.volume = value),
            setup: (self) =>
              self.hook(
                Audio,
                () => {
                  self.value = Audio.speaker?.volume || 0;
                },
                "speaker-changed",
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
export default AudioOutput;
