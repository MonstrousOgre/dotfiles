import Audio from "resource:///com/github/Aylur/ags/service/audio.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";

import { showOSD, osdIcon, osdProgress, volumePopup } from "./indicator.js";

const OSD = (monitor = 0) =>
  Widget.Window({
    name: `osd-${monitor}`, // name has to be unique
    class_name: "osd",
    visible: showOSD.bind(),
    focusable: false,
    monitor,
    child: Widget.Box({
      spacing: 40,
      vertical: true,
      css: "padding: 30px;",
      children: [Widget.Icon({ icon: osdIcon.bind(), size: 40 }), Widget.ProgressBar({ value: osdProgress.bind() })],
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
