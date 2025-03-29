import { Variable } from "astal";
import options from "../../config.json";

export const showOSD = Variable(false);

export const osdIcon = Variable("");

export const osdProgress = Variable(0);

let source = setTimeout(() => {}, 1000);

export const refresh = () => {
  source.destroy();
  showOSD.set(true);
  source = setTimeout(() => {
    showOSD.set(false);
  }, options.osd.timeout);
};
