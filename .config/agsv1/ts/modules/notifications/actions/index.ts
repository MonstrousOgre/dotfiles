import { Notification } from "types/service/notifications";

export const Actions = (notif: Notification) =>
  Widget.Box({
    className: "actions",
    children: notif.actions.map(({ id, label }) =>
      Widget.Button({
        className: "action-button",
        onClicked: () => notif.invoke(id),
        hexpand: true,
        child: Widget.Label(label),
      }),
    ),
  });
