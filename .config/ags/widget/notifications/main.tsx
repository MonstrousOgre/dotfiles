import Notifd from "gi://AstalNotifd";
import { Title } from "./title";
import { NotificationIcon } from "./image";
import { Body } from "./body";
import { Dismiss } from "./dismiss";
import { Actions } from "./actions";

export const NotificationPopup = ({
  notification,
}: {
  notification: Notifd.Notification;
}) => {
  const icon = (
    <box className={"icon"}>
      <NotificationIcon notification={notification} />
    </box>
  );
  console.log(notification.urgency);
  return (
    <box
      className={`notification ${notification.urgency === 2 ? "critical" : ""}`}
      vertical
    >
      <box>
        {icon}
        <box vertical>
          <box>
            <Title notification={notification} />
            <Dismiss notification={notification} />
          </box>
          <Body notification={notification} />
        </box>
      </box>
      <Actions notification={notification} />
    </box>
  );
};
