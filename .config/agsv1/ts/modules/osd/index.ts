const audio = await Service.import("audio");
const hyprland = await Service.import("hyprland");

import { showOSD, osdIcon, osdProgress } from "./indicator.js";
import { volumePopup } from "./audioIndicator.js";
import { Monitor } from "types/service/hyprland.js";

const OSD = (monitor?: Monitor) =>
  Widget.Window({
    name: "osd", // name has to be unique
    class_name: "osd",
    visible: showOSD.bind(),
    focusable: false,
    layer: "overlay",
    clickThrough: false,
    monitor: monitor ? monitor.id : hyprland.active.monitor.bind("id"),
    child: Widget.Box({
      spacing: 40,
      vertical: true,
      css: "padding: 30px;",
      children: [
        Widget.Icon({ icon: osdIcon.bind(), size: 80 }),
        Widget.ProgressBar({ value: osdProgress.bind() }),
      ],
    }),
    setup: (self) => {
      self.hook(
        audio,
        () => {
          volumePopup();
        },
        "speaker-changed",
      );
    },
  });

export default OSD;
