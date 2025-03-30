import Notifd from "gi://AstalNotifd";
import { bind, Variable } from "astal";
import icons from "../../../utils/icons";
import { openMenu } from "../../../utils/menu";

const Notifications = () => {
  const notifd = Notifd.get_default();
  return (
    <button
      onButtonPressEvent={(clicked, event) => {
        openMenu(clicked, event, "notificationsmenu");
      }}
    >
      {bind(notifd, "notifications").as((notifications) => (
        <icon
          icon={
            notifications.length > 0
              ? icons.notifications.new
              : icons.notifications.regular
          }
        />
      ))}
    </button>
  );
};

export default Notifications;
