import { Variable, GLib, bind } from "astal";
import Hyprland from "gi://AstalHyprland";
import Apps from "gi://AstalApps";

const WindowTitle = () => {
  const hypr = Hyprland.get_default();
  const apps = new Apps.Apps();
  return bind(hypr, "focusedClient").as((client) => {
    return client === null ? (
      <></>
    ) : (
      <box spacing={8} tooltipText={bind(client, "title")}>
        {bind(client, "class").as((windowClass) => {
          let app = apps.list.find(
            (app) =>
              app.wmClass === windowClass ||
              app.entry === `${windowClass}.desktop`,
          );

          return windowClass !== "" && app ? (
            <>
              <icon icon={app.iconName ?? ""} />
              <label
                className={"client-title"}
                xalign={0}
                maxWidthChars={40}
                truncate
                wrap
                useMarkup
              >
                {app.name ?? ""}
              </label>
            </>
          ) : (
            <></>
          );
        })}
      </box>
    );
  });
};

export default WindowTitle;
