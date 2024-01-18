import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";

const WindowTitle = () =>
  Widget.Label({
    class_name: "client-title",
    label: "-",
    truncate: "end",
    xalign: 0,
    max_width_chars: 80,
    wrap: true,
    use_markup: true,
    label: Hyprland.active.client.bind("title"),
    tooltip_text: Hyprland.active.client.bind("title"),
  });

export default WindowTitle;
