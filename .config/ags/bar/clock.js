import Widget from "resource:///com/github/Aylur/ags/widget.js";
import { execAsync } from "resource:///com/github/Aylur/ags/utils.js";

import { timeFormat } from "../options.js";

const Clock = () =>
  Widget.Label({
    className: "clock",
    setup: (self) =>
      self.poll(1000, (self) =>
        execAsync(["date", timeFormat]).then((date) => (self.label = date)),
      ),
  });

export default Clock;
