import Notifd from "gi://AstalNotifd";

export const Actions = ({
  notification,
}: {
  notification: Notifd.Notification;
}) => (
  <box className={"actions"}>
    {notification.actions.map((action) => (
      <button
        onButtonReleaseEvent={() => {
          notification.invoke(action.id);
        }}
      >
        <label>{action.label}</label>
      </button>
    ))}
  </box>
);
