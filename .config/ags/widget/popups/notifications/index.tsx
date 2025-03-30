import Notifd from "gi://AstalNotifd";
import DropDownMenu from "../DropDownMenu";
import { bind } from "astal";
import { NotificationPopup } from "../../notifications/main";
import icons from "../../../utils/icons";
import { Gtk } from "astal/gtk3";
import { closeAllMenus } from "../../../utils/menu";

export default () => {
  const notifd = Notifd.get_default();
  return (
    <DropDownMenu name="notificationsmenu">
      <box
        className={"notification-menu-content"}
        css={"padding: 1px; margin: -1px;"}
      >
        <box
          className={"notification-menu-content-items"}
          spacing={10}
          vertical
        >
          <centerbox spacing={10}>
            <box className={"header"}>
              <label>Notifications</label>
            </box>
            <box />
            <box halign={Gtk.Align.END} spacing={10}>
              <button
                className={"clear"}
                onButtonReleaseEvent={(self, event) => {
                  if (event.get_button()[1] === 1) {
                    notifd.notifications.forEach((n) => n.dismiss());
                    closeAllMenus();
                  }
                }}
              >
                <box spacing={5}>
                  <label>Clear All</label>
                  <icon icon={icons.clear} />
                </box>
              </button>
            </box>
          </centerbox>
          <box className={"notifications"} css={"padding: 1px;"} vertical>
            {bind(notifd, "notifications").as((notifications) =>
              notifications.map((notification) => (
                <NotificationPopup notification={notification} />
              )),
            )}
          </box>
        </box>
      </box>
    </DropDownMenu>
  );
};
