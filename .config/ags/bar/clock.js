import Widget from "resource:///com/github/Aylur/ags/widget.js";
import { execAsync } from "resource:///com/github/Aylur/ags/utils.js";

const Clock = () =>
  Widget.Label({
    class_name: "clock",
    setup: (self) =>
      self.poll(1000, (self) => execAsync(["date", "+%I:%M:%S %p %b %e"]).then((date) => (self.label = date))),
  });

export default Clock;
