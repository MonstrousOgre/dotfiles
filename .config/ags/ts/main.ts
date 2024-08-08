import Bar from "./modules/bar/Bar";
import Notifications from "./modules/notifications/index";
import MenuWindows from "./modules/menus/main";
import { getMonitorsForBar } from "./utils/monitors";
import { forMonitor } from "./utils/utils";
import OSD from "./modules/osd/index";

// main scss file
const scss = `${App.configDir}/styles/style.scss`;

// target css file
const css = `/tmp/ags/style.css`;

// compile, reset, apply
Utils.exec(`sass ${scss} ${css}`);

Utils.monitorFile(
  // directory that contains the scss files
  `${App.configDir}/styles`,

  // reload function
  () => {
    // compile, reset, apply
    Utils.exec(`sass ${scss} ${css}`);
    App.resetCss();
    App.applyCss(css);
  },
);

const bars = forMonitor(Bar, getMonitorsForBar());

const notifications = forMonitor(Notifications, getMonitorsForBar());
const osds = forMonitor(OSD, getMonitorsForBar());

App.config({
  style: css,
  windows: [...MenuWindows, ...bars],
});
