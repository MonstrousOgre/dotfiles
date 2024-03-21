import App from "resource:///com/github/Aylur/ags/app.js";
import Bar from "./bar/bar.js";
import Settings from "./bar/settings/settings.js";
import OSD from "./osd/osd.js";
import Notifications from "./notification-popups/notificationPopups.js";

import { monitors } from "./options.js";

import { monitorFile } from "resource:///com/github/Aylur/ags/utils.js";

const resetCSS = () => {
  App.resetCss();
  App.applyCss(`${App.configDir}/style.css`);
};

monitorFile(`${App.configDir}/style.css`, resetCSS);
monitorFile(`${App.configDir}/bar/style.css`, resetCSS);
monitorFile(`${App.configDir}/osd/style.css`, resetCSS);
monitorFile(`${App.configDir}/notification-popups/style.css`, resetCSS);

const windows = [];

const bars = monitors.map((monitor) => Bar(monitor));
const settings = monitors.map((monitor) => Settings(monitor));

const osds = monitors.map((monitor) => OSD(monitor));
const notifications = monitors.map((monitor) => Notifications(monitor));

windows.push(...bars, ...settings);

// exporting the config so ags can manage the windows
App.config({
  style: App.configDir + "/style.css",
  windows: windows,
});
