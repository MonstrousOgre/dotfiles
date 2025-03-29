import Wp from "gi://AstalWp";
import icons from "../../utils/icons";
import { osdIcon, osdProgress, refresh } from "./indicator.js";

let volumeSet = false;
let volume = 0;
let isMuted: boolean | undefined = false;

export const volumePopup = () => {
  const audio = Wp.get_default()!.audio;
  if (audio.defaultSpeaker) {
    if (
      audio.defaultSpeaker.mute === isMuted &&
      audio.defaultSpeaker.volume === volume
    ) {
      return;
    }
    volume = audio.defaultSpeaker.volume;
    isMuted = audio.defaultSpeaker.mute;
    osdProgress.set(Math.min(audio.defaultSpeaker.volume, 100));
    osdIcon.set(audio.defaultSpeaker.volumeIcon);

    if (volumeSet) refresh();
    volumeSet = true;
  }
};
