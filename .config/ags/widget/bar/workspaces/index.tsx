import { Variable, GLib, bind } from "astal";
import { Astal, Gtk, Gdk } from "astal/gtk3";
import Hyprland from "gi://AstalHyprland";
import config from "../../../config.json";

const urgentWorkspaces = new Set();

export const Workspaces = (monitor: Hyprland.Monitor) => {
  const hypr = Hyprland.get_default();

  const { formatIcons, persistentWorkspaces } = config.workspaces;
  return (
    <box className="Workspaces">
      {bind(hypr, "workspaces").as((wss) => {
        const existing = wss.map((w) => w.id);
        const arr = Array.from(new Set(existing.concat(persistentWorkspaces)));
        return arr
          .filter((id) => !(id >= -99 && id <= -2)) // filter out special workspaces
          .sort((a, b) => a - b)
          .map((id) => {
            const ws = wss.find((x) => x.id === id);
            return (
              <button
                className={bind(hypr, "focusedWorkspace").as((fw) => {
                  if (id === fw.id) {
                    urgentWorkspaces.delete(id);
                  }
                  return `${id === fw.id ? "focused" : ""} ${ws ? "" : "persistent"} ${urgentWorkspaces.has(id) ? "urgent" : ""}`;
                })}
                onClicked={() => hypr.dispatch(`workspace`, `${id}`)}
                setup={(self) => {
                  self.hook(hypr, "urgent", (_, client: Hyprland.Client) => {
                    if (client) {
                      urgentWorkspaces.add(client.workspace.id);
                      if (client.workspace.id === id)
                        self.toggleClassName("urgent", true);
                    }
                  });
                }}
              >
                {formatIcons[`${id}` as keyof typeof formatIcons] ?? id}
              </button>
            );
          });
      })}
    </box>
  );
};
