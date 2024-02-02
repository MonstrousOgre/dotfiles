import Audio from "resource:///com/github/Aylur/ags/service/audio.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";

import { showOSD, osdIcon, osdProgress } from "./indicator.js";
import { volumePopup } from "./audioIndicator.js";

const OSD = (monitor = 0) =>
  Widget.Window({
    name: "osd", // name has to be unique
    class_name: "osd",
    visible: showOSD.bind(),
    focusable: false,
    layer: "overlay",
    clickThrough: false,
    monitor,
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
        Audio,
        () => {
          volumePopup();
        },
        "speaker-changed",
      );
    },
  });

export default OSD;
