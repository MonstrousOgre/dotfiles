import { Gtk } from "astal/gtk3";
import Notifd from "gi://AstalNotifd";

export const Title = ({
  notification,
}: {
  notification: Notifd.Notification;
}) => (
  <label
    className={"title"}
    xalign={0}
    justify={Gtk.Justification.LEFT}
    hexpand
    maxWidthChars={24}
    truncate
    wrap
    useMarkup
  >
    {notification.summary}
  </label>
);
