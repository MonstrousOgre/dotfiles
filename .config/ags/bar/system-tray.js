import SystemTray from "resource:///com/github/Aylur/ags/service/systemtray.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";

const SysTray = () =>
  Widget.Box({
    children: SystemTray.bind("items").transform((items) => {
      return items.map((item) =>
        Widget.Button({
          child: Widget.Icon().bind("icon", item, "icon"),
          onPrimaryClick: (_, event) => item.activate(event),
          onSecondaryClick: (_, event) => item.openMenu(event),
        }).bind("tooltip-markup", item, "tooltip-markup"),
      );
    }),
  });

export default SysTray;
