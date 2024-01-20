import App from "resource:///com/github/Aylur/ags/app.js";
import Bar from "./bar/bar.js";

import { monitors } from "./options.js";

import { monitorFile } from "resource:///com/github/Aylur/ags/utils.js";

monitorFile(`${App.configDir}/style.css`, function () {
  App.resetCss();
  App.applyCss(`${App.configDir}/style.css`);
});

const bars = monitors.map((monitor) => Bar(monitor));

// exporting the config so ags can manage the windows
export default {
  style: App.configDir + "/style.css",
  windows: [
    //Bar(),
    //Bar(0),
    bars,
  ],
};
