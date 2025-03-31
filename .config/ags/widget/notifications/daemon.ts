import { GLib, Variable } from "astal";
import Notifd from "gi://AstalNotifd";
import options from "../../config.json";

export const notificationPopups = Variable<Notifd.Notification[]>([]);

const timeouts: { [key in number]: GLib.Source } = {};

const notifd = Notifd.get_default();

export const dismissNotificationPopup = (id: number) => {
  notificationPopups.set(notificationPopups.get().filter((n) => n.id !== id));
  delete timeouts[id];
};

notifd.connect("notified", (_, id) => {
  const notification = notifd.get_notification(id);
  const timeout = timeouts[id];
  if (timeout) {
    timeout.destroy();
    delete timeouts[id];
  }
  notificationPopups.set([
    ...notificationPopups.get().filter((n) => n.id !== notification.id),
    notification,
  ]);

  timeouts[id] = setTimeout(
    () => {
      dismissNotificationPopup(id);
    },
    Math.max(notification.expireTimeout, options.notifications.timeout),
  );
});
