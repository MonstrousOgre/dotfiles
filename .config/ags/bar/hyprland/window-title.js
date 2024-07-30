import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";
const { query } = await Service.import("applications");

const WindowTitle = () =>
  Widget.Box({
    spacing: 8,
    tooltipText: Hyprland.active.client.bind("title"),
    children: [
      Widget.Icon("").hook(Hyprland.active.client, (self) => {
        const client = Hyprland.active.client;
        const apps = query(client.class);
        if (client.class === "" || apps.length === 0) {
          self.icon = "";
        } else {
          self.icon = apps[0].iconName;
        }
      }),
      Widget.Label({
        className: "client-title",
        truncate: "end",
        xalign: 0,
        maxWidthChars: 80,
        wrap: true,
        useMarkup: true,
        label: "",
      }).hook(Hyprland.active.client, (self) => {
        const client = Hyprland.active.client;
        const apps = query(client.class);
        if (client.class === "" || apps.length === 0) {
          self.label = client.title;
        } else {
          self.label = apps[0].name;
        }
      }),
    ],
  });

export default WindowTitle;
