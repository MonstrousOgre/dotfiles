import { osdTimeout } from "../options.js";

import Variable from "resource:///com/github/Aylur/ags/variable.js";

export const showOSD = Variable(false);

export const osdIcon = Variable("");

export const osdProgress = Variable(0);

let source = setTimeout(() => {}, 1000);

export const refresh = () => {
  source.destroy();
  showOSD.value = true;
  source = setTimeout(() => {
    showOSD.value = false;
  }, osdTimeout);
};
