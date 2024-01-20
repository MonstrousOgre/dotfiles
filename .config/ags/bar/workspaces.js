import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";

import Widget from "resource:///com/github/Aylur/ags/widget.js";

import { formatIcons, persistentWorkspaces } from "../options.js";

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
          child: Widget.Label(`${formatIcons[id]}`),
          className: Hyprland.active.workspace
            .bind("id")
            .transform((i) => `${i === id ? "focused" : ""} ${!existing.includes(id) ? "persistent" : ""}`),
        }),
      );
    }),
  });

export default Workspaces;
