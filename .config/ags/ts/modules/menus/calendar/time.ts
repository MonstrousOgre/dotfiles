import { options } from "ts/globals.js";

export const TimeWidget = () => {
  const timeFormat = options.clock.longTimeFormat;
  return Widget.Label({
    className: "time",
    setup: (self) =>
      self.poll(1000, (self) =>
        Utils.execAsync(["date", timeFormat]).then(
          (date) => (self.label = date),
        ),
      ),
  });
};
