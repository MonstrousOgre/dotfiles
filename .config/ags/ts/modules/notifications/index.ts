const notifications = await Service.import("notifications");
import { Monitor } from "types/service/hyprland";
import { NotificationPopup } from "./main";

export default (monitor: Monitor) =>
  Widget.Window({
    name: "notifications",
    monitor: monitor.id,
    class_name: "notifications",
    anchor: ["top", "right"],
    child: Widget.Box({
      css: "padding: 1px;",
      className: "notifications",
      vertical: true,
      children: notifications.bind("popups").as((popups) => {
        return popups.map(NotificationPopup);
      }),
    }),
  });
