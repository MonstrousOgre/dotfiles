import Gtk from "types/@girs/gtk-3.0/gtk-3.0";
import { Notification } from "types/service/notifications";

export const NotificationIcon = ({
  app_entry,
  app_icon,
  image,
}: Notification): Gtk.Widget => {
  if (image) {
    return Widget.Box({
      css: `
                background-image: url("${image}");
                background-size: contain;
                background-repeat: no-repeat;
                background-position: center;
            `,
    });
  }

  let icon = "dialog-information-symbolic";
  if (Utils.lookUpIcon(app_icon)) icon = app_icon;

  if (app_entry && Utils.lookUpIcon(app_entry)) icon = app_entry;

  return Widget.Icon(icon);
};
