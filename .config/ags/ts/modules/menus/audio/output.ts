const audio = await Service.import("audio");
import Variable from "resource:///com/github/Aylur/ags/variable.js";

// import icons from "../../../icons.js";
import icons from "ts/utils/icons.js";

// import Toggler from "../../toggler.js";
import { Devices } from "./devices.js";

export const AudioOutput = () => {
  const { muted, low, high, medium, overamplified } = icons.volume;

  // const showDevices = Variable(false);
  return Widget.Box({
    vertical: true,
    children: [
      Widget.Box({
        children: [
          Widget.Button({
            child: Widget.Icon(icons.volume.medium).hook(audio, (self) => {
              if (audio.speaker?.stream) {
                if (audio.speaker.stream.isMuted) {
                  self.icon = muted;
                } else {
                  const cons = [
                    [101, overamplified],
                    [67, high],
                    [34, medium],
                    [0, low],
                  ];
                  self.icon =
                    (cons.find(
                      ([n]) => (n as number) <= audio.speaker.volume * 100,
                    )?.[1] as string) || "";
                }
              }
            }),
            onPrimaryClick: () => {
              Utils.execAsync("pactl set-sink-mute @DEFAULT_SINK@ toggle");
              // Audio.speaker.stream.isMuted = !Audio.speaker.stream.isMuted;
            },
          }),
          Widget.Slider({
            hexpand: true,
            drawValue: false,
            onChange: ({ value }) => (audio.speaker.volume = value),
            setup: (self) =>
              self.hook(
                audio,
                () => {
                  self.value = audio.speaker?.volume || 0;
                },
                "speaker-changed",
              ),
          }),
        ],
      }),
      Devices("speaker"),
    ],
  });
};
