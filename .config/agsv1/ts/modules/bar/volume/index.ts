const audio = await Service.import("audio");
import icons from "ts/utils/icons";
import { openMenu } from "../utils";
import Gdk from "types/@girs/gdk-3.0/gdk-3.0";

const Volume = () => {
  const { muted, low, high, medium, overamplified } = icons.volume;

  return Widget.Button({
    className: "audio",
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
    onPrimaryClick: (clicked: any, event: Gdk.Event) =>
      openMenu(clicked, event, "audiomenu"),
  });
};

export default Volume;
