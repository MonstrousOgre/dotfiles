import Notifd from "gi://AstalNotifd";
import Hyprland from "gi://AstalHyprland";
import { bind } from "astal";
import { Astal } from "astal/gtk3";
import { NotificationPopup } from "./main";

export default (monitor?: Hyprland.Monitor) => {
  const notifd = Notifd.get_default();
  const hypr = Hyprland.get_default();
  return (
    <window
      name={"notifications"}
      className={"notifications"}
      anchor={Astal.WindowAnchor.TOP + Astal.WindowAnchor.RIGHT}
      monitor={
        monitor
          ? monitor.id
          : bind(hypr, "focusedMonitor").as((monitor) => monitor.id)
      }
    >
      <box className={"notifications"} css={"padding: 1px;"} vertical>
        {bind(notifd, "notifications").as((notifications) =>
          notifications.map((notification) => (
            <NotificationPopup notification={notification} />
          )),
        )}
      </box>
    </window>
  );
};
