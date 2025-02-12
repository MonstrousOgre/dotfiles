import { Notification } from "types/service/notifications";
import { Title } from "./title/index";
import { Body } from "./body/index";
import { Actions } from "./actions/index";
import { NotificationIcon } from "./image/index";

export const NotificationPopup = (notif: Notification) => {
  const icon = Widget.Box({
    vpack: "start",
    className: "icon",
    child: NotificationIcon(notif),
  });

  return Widget.EventBox({
    onPrimaryClick: () => notif.dismiss(),
    child: Widget.Box({
      className: `notification ${notif.urgency}`,
      vertical: true,
      children: [
        Widget.Box({
          children: [
            icon,
            Widget.Box({
              vertical: true,
              children: [Title(notif), Body(notif)],
            }),
          ],
        }),
        Actions(notif),
      ],
    }),
  });
};
