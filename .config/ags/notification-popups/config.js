import App from "resource:///com/github/Aylur/ags/app.js";
import { notificationPopup } from "./notificationPopups.js";
import { execAsync, timeout } from "resource:///com/github/Aylur/ags/utils.js";

import { monitors } from "../options.js";

/*timeout(100, () =>*/
/*execAsync([*/
/*"notify-send",*/
/*"Notification Popup Example",*/
/*"Lorem ipsum dolor sit amet, qui minim labore adipisicing " + "minim sint cillum sint consectetur cupidatat.",*/
/*"-A",*/
/*"Cool!",*/
/*"-i",*/
/*"info-symbolic",*/
/*]),*/
/*);*/

import { monitorFile } from "resource:///com/github/Aylur/ags/utils.js";

monitorFile(`${App.configDir}/style.css`, function () {
  App.resetCss();
  App.applyCss(`${App.configDir}/style.css`);
});

const notificatonPopups = monitors.map((monitor) => notificationPopup(monitor));

export default {
  style: App.configDir + "/style.css",
  windows: notificatonPopups,
};
