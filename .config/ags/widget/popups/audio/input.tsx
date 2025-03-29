import Wp from "gi://AstalWp";

import icons from "../../../utils/icons";

import { Devices } from "./devices";
import { bind } from "astal";

export const AudioInput = () => {
  const audio = Wp.get_default()!.audio;
  const { muted, low, high, medium, overamplified } = icons.volume;

  return (
    <box vertical>
      <box>
        {bind(audio, "defaultMicrophone").as((microphone) => {
          return microphone ? (
            <>
              <button
                onButtonPressEvent={(self, event) => {
                  if (event.get_button()[1] === 1) {
                    microphone.set_mute(!microphone.get_mute());
                  }
                }}
              >
                <icon icon={bind(microphone, "volumeIcon")} />
              </button>
              <slider
                hexpand
                drawValue={false}
                value={bind(microphone, "volume") || 0}
                onDragged={(self) => {
                  microphone.set_volume(self.value);
                }}
              />
            </>
          ) : (
            <></>
          );
        })}
      </box>
      <Devices deviceType={"microphone"} />
    </box>
  );
};
