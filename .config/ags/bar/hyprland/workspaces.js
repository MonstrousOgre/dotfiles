import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";

import Widget from "resource:///com/github/Aylur/ags/widget.js";

import { formatIcons, persistentWorkspaces } from "../../options.js";

const urgentWorkspaces = new Set();

const Workspaces = () =>
  Widget.Box({
    className: "workspaces",
    children: Hyprland.bind("workspaces").transform((ws) => {
      const existing = ws.map((w) => w.id);
      const arr = Array.from(new Set(existing.concat(persistentWorkspaces)));
      arr.sort((a, b) => a - b);
      return arr.map((id) =>
        Widget.Button({
          onClicked: () => Hyprland.sendMessage(`dispatch workspace ${id}`),
          //child: Widget.Label(`${id}`),
          child: Widget.Label(`${formatIcons[id] ?? formatIcons.default}`),
          // className: Hyprland.active.workspace
          //   .bind("id")
          //   .transform((i) => `${i === id ? "focused" : ""} ${!existing.includes(id) ? "persistent" : ""}`),
          setup: (self) => {
            self.hook(
              Hyprland,
              (_, windowaddress) => {
                if (windowaddress) {
                  const client = Hyprland.getClient(windowaddress);
                  // console.log(client);
                  urgentWorkspaces.add(client.workspace.id);
                }
              },
              "urgent-window",
            );

            self.hook(Hyprland, (_) => {
              if (Hyprland.active.workspace.id === id) {
                self.toggleClassName("focused", true);
                urgentWorkspaces.delete(id);
                self.toggleClassName("urgent", false);
              } else {
                self.toggleClassName("focused", false);
              }
              if (!existing.includes(id)) {
                self.toggleClassName("persistent", true);
              }

              if (urgentWorkspaces.has(id)) {
                self.toggleClassName("urgent", true);
              }
            });
          },
        }),
      );
    }),
  });

export default Workspaces;
