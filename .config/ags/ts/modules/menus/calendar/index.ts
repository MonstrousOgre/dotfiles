import DropdownMenu from "../DropDownMenu";
import { CalendarWidget } from "./calendar";
import { TimeWidget } from "./time";

export default () => {
  return DropdownMenu({
    name: "calendarmenu",
    child: Widget.Box({
      className: "calendar-menu-content",
      css: "padding: 1px; margin: -1px;",
      vexpand: false,
      children: [
        Widget.Box({
          className: "calendar-menu-content-items",
          spacing: 10,
          vertical: true,
          children: [TimeWidget(), CalendarWidget()],
        }),
      ],
    }),
  });
};
