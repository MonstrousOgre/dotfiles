import Notifd from "gi://AstalNotifd";

export const NotificationIcon = ({
  notification,
}: {
  notification: Notifd.Notification;
}) => {
  const { appName, appIcon, image } = notification;
  if (notification.image) {
    return (
      <box
        css={`
          background-image: url("${image}");
          background-size: contain;
          background-repeat: no-repeat;
          background-position: center;
        `}
      />
    );
  }

  let icon = "dialog-information-symbolic";

  return <icon icon={appIcon} />;
};
