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
          const applications = apps.exact_query(windowClass);

          return windowClass === "" || applications.length === 0 ? (
            <></>
          ) : (
            <>
              <icon icon={applications[0].iconName ?? ""} />
              <label
                className={"client-title"}
                xalign={0}
                maxWidthChars={40}
                truncate
                wrap
                useMarkup
              >
                {applications[0].name ?? ""}
              </label>
            </>
          );
        })}
      </box>
    );
  });
};

export default WindowTitle;
