import { Notification } from "types/service/notifications";

export const Title = (notif: Notification) =>
  Widget.Label({
    className: "title",
    xalign: 0,
    justification: "left",
    hexpand: true,
    maxWidthChars: 24,
    truncate: "end",
    wrap: true,
    label: notif.summary,
    useMarkup: true,
  });
