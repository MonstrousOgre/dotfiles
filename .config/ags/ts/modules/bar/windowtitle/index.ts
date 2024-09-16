const hyprland = await Service.import("hyprland");
const { query } = await Service.import("applications");

const WindowTitle = () =>
  Widget.Box({
    spacing: 8,
    tooltipText: hyprland.active.client.bind("title"),
    children: [
      Widget.Icon("").hook(hyprland.active.client, (self) => {
        const client = hyprland.active.client;
        const apps = query(client.class);
        if (
          hyprland.getClient(client.address)?.initialTitle.includes("Spotify")
        ) {
          self.icon = "spotify";
        } else if (client.class === "" || apps.length === 0) {
          self.icon = "";
        } else {
          self.icon = apps[0].icon_name ?? "";
        }
      }),
      Widget.Label({
        className: "client-title",
        truncate: "end",
        xalign: 0,
        maxWidthChars: 40,
        wrap: true,
        useMarkup: true,
        label: "",
      }).hook(hyprland.active.client, (self) => {
        const client = hyprland.active.client;
        const apps = query(client.class);
        if (client.class === "" || apps.length === 0) {
          self.label =
            hyprland.getClient(client.address)?.initialTitle ?? client.title;
        } else {
          self.label = apps[0].name;
        }
      }),
    ],
  });

export default WindowTitle;
