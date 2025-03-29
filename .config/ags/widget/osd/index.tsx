import Wp from "gi://AstalWp";
import Hyprland from "gi://AstalHyprland";

import { showOSD, osdIcon, osdProgress } from "./indicator.js";
import { volumePopup } from "./audioIndicator.js";
import { bind } from "astal";
import { Astal } from "astal/gtk3";

const OSD = (monitor?: Hyprland.Monitor) => {
  const audio = Wp.get_default()!.audio;
  const hypr = Hyprland.get_default();
  return (
    <window
      name={"osd"}
      className={"osd"}
      visible={bind(showOSD)}
      layer={Astal.Layer.OVERLAY}
      monitor={
        monitor
          ? monitor.id
          : bind(hypr, "focusedMonitor").as((monitor) => monitor.id)
      }
      clickThrough
      setup={(self) => {
        self
          .hook(audio.defaultSpeaker, "notify::volume", () => {
            volumePopup();
          })
          .hook(audio.defaultSpeaker, "notify::mute", () => {
            volumePopup();
          });
      }}
    >
      <box spacing={40} widthRequest={200} css={"padding: 30px;"} vertical>
        <icon icon={bind(osdIcon)}></icon>
        <levelbar value={bind(osdProgress)} />
      </box>
    </window>
  );
};

export default OSD;
