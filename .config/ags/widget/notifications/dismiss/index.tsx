import Notifd from "gi://AstalNotifd";

import icons from "../../../utils/icons";

export const Dismiss = ({
  notification,
}: {
  notification: Notifd.Notification;
}) => (
  <button
    className={"dismiss"}
    onButtonReleaseEvent={() => notification.dismiss()}
  >
    <icon icon={icons.close} />
  </button>
);
