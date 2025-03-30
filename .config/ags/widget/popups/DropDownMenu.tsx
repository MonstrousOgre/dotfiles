import Hyprland from "gi://AstalHyprland";
import { globalMousePos } from "../../utils/globals";
import { bind, exec, Variable } from "astal";
import { App, Astal, Gdk, Gtk, Widget } from "astal/gtk3";
import { closeAllMenus } from "../../utils/menu";

const moveBoxToCursor = (self: any, fixed: boolean) => {
  if (fixed) {
    return;
  }

  globalMousePos.subscribe((value) => {
    const hypr = Hyprland.get_default();
    const currentWidth = self.get_allocation().width;

    let monWidth = hypr.focusedMonitor.width;
    let monHeight = hypr.focusedMonitor.height;

    // If GDK Scaling is applied, then get divide width by scaling
    // to get the proper coordinates.
    // Ex: On a 2860px wide monitor... if scaling is set to 2, then the right
    // end of the monitor is the 1430th pixel.
    const gdkScale = exec('bash -c "echo $GDK_SCALE"');

    if (/^\d+(.\d+)?$/.test(gdkScale)) {
      const scale = parseFloat(gdkScale);
      monWidth = monWidth / scale;
      monHeight = monHeight / scale;
    }

    // If monitor is vertical (transform = 1 || 3) swap height and width
    if (hypr.focusedMonitor.transform % 2 !== 0) {
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
  initRender.set(false);
}, 400);

export default ({
  name,
  child,
  exclusivity = Astal.Exclusivity.IGNORE,
  fixed = false,
  ...props
}: {
  name: string;
  child?: Gtk.Widget;
  exclusivity?: Astal.Exclusivity;
  fixed?: boolean;
}) => {
  return (
    <window
      name={name}
      className={`${name} dropdown-menu`}
      visible={bind(initRender)}
      keymode={Astal.Keymode.ON_DEMAND}
      exclusivity={exclusivity}
      layer={Astal.Layer.OVERLAY}
      anchor={Astal.WindowAnchor.TOP + Astal.WindowAnchor.LEFT}
    >
      <eventbox
        className="parent-event"
        onClick={() => App.toggle_window(name)}
      >
        <eventbox
          className="in-eb menu-event-box"
          onClick={() => {
            return true;
          }}
          setup={(self) => {
            moveBoxToCursor(self, fixed);
          }}
          onKeyReleaseEvent={(self, event) => {
            if (event.get_keyval()[1] === Gdk.KEY_Escape) {
              closeAllMenus();
            }
          }}
        >
          <box className={"dropdown-menu-container"} canFocus>
            {child}
          </box>
        </eventbox>
      </eventbox>
    </window>
  );
};
