const hyprland = await Service.import("hyprland");
import { globalMousePos } from "../../globals";

const moveBoxToCursor = (self: any, fixed: boolean) => {
  if (fixed) {
    return;
  }

  globalMousePos.connect("changed", ({ value }) => {
    const currentWidth = self.child.get_allocation().width;

    let monWidth = hyprland.monitors[hyprland.active.monitor.id].width;
    let monHeight = hyprland.monitors[hyprland.active.monitor.id].height;

    // If GDK Scaling is applied, then get divide width by scaling
    // to get the proper coordinates.
    // Ex: On a 2860px wide monitor... if scaling is set to 2, then the right
    // end of the monitor is the 1430th pixel.
    const gdkScale = Utils.exec('bash -c "echo $GDK_SCALE"');

    if (/^\d+(.\d+)?$/.test(gdkScale)) {
      const scale = parseFloat(gdkScale);
      monWidth = monWidth / scale;
      monHeight = monHeight / scale;
    }

    // If monitor is vertical (transform = 1 || 3) swap height and width
    if (hyprland.monitors[hyprland.active.monitor.id].transform % 2 !== 0) {
      [monWidth, monHeight] = [monHeight, monWidth];
    }

    let marginRight = monWidth - currentWidth / 2;
    marginRight = fixed ? marginRight - monWidth / 2 : marginRight - value[0];
    let marginLeft = monWidth - currentWidth - marginRight;

    const minimumMargin = 0;

    if (marginRight < minimumMargin) {
      marginRight = minimumMargin;
      marginLeft = monWidth - currentWidth - minimumMargin;
    }

    if (marginLeft < minimumMargin) {
      marginLeft = minimumMargin;
      marginRight = monWidth - currentWidth - minimumMargin;
    }

    const marginTop = 30;
    const marginBottom = monHeight - marginTop;
    self.set_margin_left(marginLeft);
    self.set_margin_right(marginRight);
    self.set_margin_bottom(marginBottom);
    self.set_margin_top(marginTop);
  });
};

const initRender = Variable(true);

setTimeout(() => {
  initRender.value = false;
}, 400);

export default ({
  name,
  child,
  exclusivity = "ignore" as "normal" | "ignore" | "exclusive",
  fixed = false,
  ...props
}) =>
  Widget.Window({
    name,
    classNames: [name, "dropdown-menu"],
    setup: (w) => w.keybind("Escape", () => App.closeWindow(name)),
    visible: initRender.bind("value"),
    keymode: "on-demand",
    exclusivity,
    layer: "top",
    anchor: ["top", "left"],
    child: Widget.EventBox({
      className: "parent-event",
      onPrimaryClick: () => App.closeWindow(name),
      onSecondaryClick: () => App.closeWindow(name),
      child: Widget.EventBox({
        className: "in-eb menu-event-box",
        onPrimaryClick: () => {
          return true;
        },
        onSecondaryClick: () => {
          return true;
        },
        setup: (self) => {
          moveBoxToCursor(self, fixed);
        },
        child: Widget.Box({
          class_name: "dropdown-menu-container",
          can_focus: true,
          children: [child],
        }),
      }),
    }),
    ...props,
  });
