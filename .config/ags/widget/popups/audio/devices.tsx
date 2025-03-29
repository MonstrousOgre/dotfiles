import { bind } from "astal";
import Wp from "gi://AstalWp";

type DeviceProps = {
  deviceType: "speaker" | "microphone";
};

export const Devices = ({ deviceType }: DeviceProps) => {
  const audio = Wp.get_default()!.audio;
  return (
    <box className={"devices"} vertical>
      {bind(audio, `${deviceType}s`).as((devices) =>
        devices?.map((device) => (
          <button
            className={bind(device, "isDefault").as((isDefault) =>
              isDefault ? "selected" : "",
            )}
            onButtonPressEvent={(self, event) => {
              if (event.get_button()[1] === 1) {
                device.set_is_default(true);
              }
            }}
          >
            <label
              maxWidthChars={50}
              useMarkup
              tooltipText={bind(device, "description")}
            >
              {bind(device, "description")}
            </label>
          </button>
        )),
      )}
    </box>
  );
};
