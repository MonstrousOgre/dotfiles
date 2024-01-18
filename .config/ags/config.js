import App from "resource:///com/github/Aylur/ags/app.js";
import Bar from "./bar/bar.js";

import { monitorFile } from "resource:///com/github/Aylur/ags/utils.js";

monitorFile(`${App.configDir}/style.css`, function () {
  App.resetCss();
  App.applyCss(`${App.configDir}/style.css`);
});

const monitors = [0, 1];

const bars = monitors.map((monitor) => Bar(monitor));

// exporting the config so ags can manage the windows
export default {
  style: App.configDir + "/style.css",
  windows: [
    //Bar(),

    //you can call it, for each monitor
    //Bar(0),
    //Bar(1),
    bars,
  ],
};
