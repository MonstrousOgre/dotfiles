import Notifd from "gi://AstalNotifd";

import icons from "../../../utils/icons";
import { dismissNotificationPopup } from "../daemon";

export const Dismiss = ({
  notification,
}: {
  notification: Notifd.Notification;
}) => (
  <button
    className={"dismiss"}
    onButtonReleaseEvent={() => {
      dismissNotificationPopup(notification.id);
      notification.dismiss();
    }}
  >
    <icon icon={icons.clear} />
  </button>
);
