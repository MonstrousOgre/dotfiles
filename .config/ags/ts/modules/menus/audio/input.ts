const audio = await Service.import("audio");
import Variable from "resource:///com/github/Aylur/ags/variable.js";

import { Devices } from "./devices.js";
import icons from "ts/utils/icons.js";

const AudioInput = () => {
  const { muted, mic } = icons.mic;

  const showDevices = Variable(false);
  return Widget.Box({
    vertical: true,
    children: [
      Widget.Box({
        children: [
          Widget.Button({
            child: Widget.Icon(icons.volume.medium).hook(audio, (self) => {
              if (audio.microphone?.stream) {
                self.icon = audio.microphone.stream.isMuted ? muted : mic;
              }
            }),
            onPrimaryClick: () => {
              Utils.execAsync("pactl set-source-mute @DEFAULT_SOURCE@ toggle");
              // Audio.microphone.stream.isMuted = !Audio.microphone.stream.isMuted;
            },
          }),
          Widget.Slider({
            hexpand: true,
            drawValue: false,
            onChange: ({ value }) => (audio.microphone.volume = value),
            setup: (self) =>
              self.hook(
                audio,
                () => {
                  self.value = audio.microphone?.volume || 0;
                },
                "microphone-changed",
              ),
          }),
        ],
      }),
      Devices("microphone"),
    ],
  });
};
export default AudioInput;
