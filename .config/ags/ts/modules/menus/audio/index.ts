import DropdownMenu from "../DropDownMenu";
import AudioInput from "./input";
import { AudioOutput } from "./output";

export default () => {
  return DropdownMenu({
    name: "audiomenu",
    child: Widget.Box({
      className: "audio-menu-content",
      css: "padding: 1px; margin: -1px;",
      vexpand: false,
      children: [
        Widget.Box({
          className: "audio-menu-content-items",
          spacing: 10,
          vertical: true,
          children: [AudioOutput(), AudioInput()],
        }),
      ],
    }),
  });
};
