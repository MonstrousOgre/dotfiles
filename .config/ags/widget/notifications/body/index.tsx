import { Gtk } from "astal/gtk3";
import Notifd from "gi://AstalNotifd";

export const Body = ({
  notification,
}: {
  notification: Notifd.Notification;
}) => (
  <label
    className={"body"}
    hexpand
    useMarkup
    xalign={0}
    justify={Gtk.Justification.LEFT}
    wrap
  >
    {notification.body}
  </label>
);
