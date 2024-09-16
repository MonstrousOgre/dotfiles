import DropdownMenu from "../DropDownMenu";
import RemainingWidget from "./time";

export default () => {
  return DropdownMenu({
    name: "powermenu",
    child: Widget.Box({
      className: "power-menu-content",
      css: "padding: 1px; margin: -1px;",
      vexpand: false,
      children: [
        Widget.Box({
          className: "power-menu-content-items",
          spacing: 10,
          vertical: true,
          children: [RemainingWidget()],
        }),
      ],
    }),
  });
};
