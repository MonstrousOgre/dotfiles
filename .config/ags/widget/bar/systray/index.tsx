import { bind, Variable } from "astal";
import { Astal, Gdk, Gtk } from "astal/gtk3";
import Tray from "gi://AstalTray";

const tray = Tray.get_default();

const SysTrayItem = (item: Tray.TrayItem) => {
  let menu = Variable.derive(
    [bind(item, "menuModel"), bind(item, "actionGroup")],
    (menuModel, actionGroup) => {
      const gtkMenu = Gtk.Menu.new_from_model(menuModel);
      gtkMenu.insert_action_group("dbusmenu", actionGroup);

      return gtkMenu;
    },
  );
  return (
    <button
      tooltipMarkup={bind(item, "tooltipMarkup")}
      // actionGroup={bind(item, "actionGroup").as((ag) => ["dbusmenu", ag])}
      onButtonPressEvent={(self, event) => {
        if (event.get_button()[1] === 1) {
          item.activate(0, 0);
        }
        if (event.get_button()[1] === 3) {
          menu
            .get()
            .popup_at_widget(self, Gdk.Gravity.NORTH, Gdk.Gravity.SOUTH, event);
        }
      }}
      onDestroy={() => menu.drop()}
    >
      <icon /* icon={bind(item, "iconName")} */ gicon={bind(item, "gicon")} />
    </button>
  );
};

const SysTray = () => (
  <box>{bind(tray, "items").as((items) => items.map(SysTrayItem))}</box>
);

export default SysTray;
