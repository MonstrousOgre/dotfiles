import Wp from "gi://AstalWp";

import icons from "../../../utils/icons";

import { Devices } from "./devices";
import { bind } from "astal";

export const AudioOutput = () => {
  const audio = Wp.get_default()!.audio;
  const { muted, low, high, medium, overamplified } = icons.volume;

  return (
    <box vertical>
      <box>
        {bind(audio, "defaultSpeaker").as((speaker) => (
          <>
            <button
              onButtonPressEvent={(self, event) => {
                if (event.get_button()[1] === 1) {
                  speaker.set_mute(!speaker.get_mute());
                }
              }}
            >
              <icon icon={bind(speaker, "volumeIcon")} />
            </button>
            <slider
              hexpand
              drawValue={false}
              value={bind(speaker, "volume") || 0}
            />
          </>
        ))}
      </box>
      <Devices deviceType={"speaker"} />
    </box>
  );
};
