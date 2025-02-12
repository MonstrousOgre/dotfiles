const audio = await Service.import("audio");
import icons from "../../utils/icons";
import { osdIcon, osdProgress, refresh } from "./indicator.js";

import Variable from "resource:///com/github/Aylur/ags/variable.js";

let volumeSet = false;
let volume = 0;
let isMuted: boolean | undefined = false;

export const volumePopup = () => {
  if (audio.speaker) {
    if (
      audio.speaker.stream?.isMuted === isMuted &&
      audio.speaker.volume === volume
    ) {
      return;
    }
    const { muted, low, high, medium, overamplified } = icons.volume;
    volume = audio.speaker.volume;
    isMuted = audio.speaker.stream?.isMuted;
    osdProgress.value = Math.min(audio.speaker.volume, 100);
    if (audio.speaker?.stream) {
      if (audio.speaker.stream.isMuted) {
        osdIcon.value = muted;
      } else {
        const cons = [
          [101, overamplified],
          [67, high],
          [34, medium],
          [0, low],
        ];
        osdIcon.value =
          (cons.find(
            ([n]) => (n as number) <= audio.speaker.volume * 100,
          )?.[1] as string) || "";
      }
    }

    if (volumeSet) refresh();
    volumeSet = true;
  }
};
