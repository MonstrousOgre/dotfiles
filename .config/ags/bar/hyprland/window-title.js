import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";

const WindowTitle = () =>
  Widget.Label({
    className: "client-title",
    truncate: "end",
    xalign: 0,
    maxWidthChars: 80,
    wrap: true,
    useMarkup: true,
    label: Hyprland.active.client.bind("title"),
    tooltipText: Hyprland.active.client.bind("title"),
  });

export default WindowTitle;
