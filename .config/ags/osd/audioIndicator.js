import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
//import Notifications from "resource:///com/github/Aylur/ags/service/notifications.js";
import Mpris from "resource:///com/github/Aylur/ags/service/mpris.js";
import Audio from "resource:///com/github/Aylur/ags/service/audio.js";
import Battery from "resource:///com/github/Aylur/ags/service/battery.js";
import SystemTray from "resource:///com/github/Aylur/ags/service/systemtray.js";
import App from "resource:///com/github/Aylur/ags/app.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";
import { exec, execAsync } from "resource:///com/github/Aylur/ags/utils.js";
import { osdTimeout } from "../options.js";
import icons from "../icons.js";
import { osdIcon, osdProgress, refresh } from "./indicator.js";

import Variable from "resource:///com/github/Aylur/ags/variable.js";

let volumeSet = false;
let volume = 0;
let isMuted = false;

export const volumePopup = () => {
  if (Audio.speaker) {
    if (Audio.speaker.stream?.isMuted === isMuted && Audio.speaker.volume === volume) {
      return;
    }
    const { muted, low, high, medium, overamplified } = icons.volume;
    volume = Audio.speaker.volume;
    isMuted = Audio.speaker.stream?.isMuted;
    osdProgress.value = Math.min(Audio.speaker.volume, 100);
    if (Audio.speaker?.stream) {
      if (Audio.speaker.stream.isMuted) {
        osdIcon.value = muted;
      } else {
        const cons = [
          [101, overamplified],
          [67, high],
          [34, medium],
          [0, low],
        ];
        osdIcon.value = cons.find(([n]) => n <= Audio.speaker.volume * 100)?.[1] || "";
      }
    }

    if (volumeSet) refresh();
    volumeSet = true;
  }
};
