import Notifd from "gi://AstalNotifd";
import Hyprland from "gi://AstalHyprland";
import { bind, Variable } from "astal";
import { Astal } from "astal/gtk3";
import { NotificationPopup } from "./main";
import options from "../../config.json";

const notifs = Variable<Notifd.Notification[]>([]);

export default (monitor?: Hyprland.Monitor) => {
  const notifd = Notifd.get_default();
  const hypr = Hyprland.get_default();

  notifd.connect("notified", (_, id) => {
    const notification = notifd.get_notification(id);
    console.log(notification.expireTimeout);
    notifs.set([...notifs.get(), notification]);

    setTimeout(
      () => {
        notifs.set(notifs.get().filter((n) => n.id !== notification.id));
      },
      Math.max(notification.expireTimeout, options.notifications.timeout),
    );
  });

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
        {bind(notifs).as((notifications) =>
          notifications.map((notification) => (
            <NotificationPopup notification={notification} />
          )),
        )}
      </box>
    </window>
  );
};
