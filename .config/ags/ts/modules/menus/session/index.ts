import icons from "ts/utils/icons";
import DropdownMenu from "../DropDownMenu";
import { options } from "ts/globals";

const sessionOptions = [
  {
    icon: icons.session.lock,
    command: options.session.lock,
  },
  {
    icon: icons.session.logout,
    command: options.session.logout,
  },
  {
    icon: icons.session.restart,
    command: options.session.restart,
  },
  {
    icon: icons.session.shutdown,
    command: options.session.shutdown,
  },
];

export default () =>
  DropdownMenu({
    name: "sessionmenu",
    child: Widget.Box({
      className: "session-menu-content",
      css: "padding: 1px; margin: -1px;",
      vexpand: false,
      children: [
        Widget.CenterBox({
          spacing: 20,
          className: "vert",
          startWidget: Widget.Label({
            className: "user",
            label: Utils.exec("sh -c 'echo $USER'"),
          }),
          centerWidget: Widget.Label(),
          endWidget: Widget.Box({
            spacing: 40,
            children: sessionOptions.map((opt) =>
              Widget.Button({
                child: Widget.Icon(opt.icon),
                onPrimaryClickRelease: () => {
                  Utils.exec(opt.command);
                },
              }),
            ),
          }),
        }),
      ],
    }),
  });
