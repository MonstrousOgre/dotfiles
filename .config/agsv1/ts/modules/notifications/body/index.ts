import { Notification } from "types/service/notifications";

export const Body = (notif: Notification) =>
  Widget.Label({
    className: "body",
    hexpand: true,
    useMarkup: true,
    xalign: 0,
    justification: "left",
    label: notif.body,
    wrap: true,
  });
