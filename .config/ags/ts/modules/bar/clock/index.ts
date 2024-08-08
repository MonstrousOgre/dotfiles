import { options } from "ts/globals.js";
import { openMenu } from "../utils";
import Gdk from "types/@girs/gdk-3.0/gdk-3.0";

const Clock = () => {
  const timeFormat = options.clock.shortTimeFormat;
  return Widget.Button({
    child: Widget.Label({
      className: "clock",
      setup: (self) =>
        self.poll(1000, (self) =>
          Utils.execAsync(["date", timeFormat]).then(
            (date) => (self.label = date),
          ),
        ),
    }),
    onPrimaryClick: (clicked: any, event: Gdk.Event) =>
      openMenu(clicked, event, "calendarmenu"),
  });
};

export default Clock;
