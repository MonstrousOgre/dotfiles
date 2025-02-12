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
        Widget.Box({
          spacing: 20,
          className: "vert",
          vertical: true,
          children: [
            Widget.Label({
              className: "user",
              label: Utils.exec("sh -c 'echo $USER'"),
            }),
            Widget.Box({
              vertical: true,
              children: options.session.options.map((opt) =>
                Widget.Button({
                  child: Widget.Box({
                    spacing: 10,
                    children: [
                      Widget.Icon(icons.session[opt.icon]),
                      Widget.Label(opt.text),
                    ],
                  }),
                  onPrimaryClickRelease: () => {
                    Utils.exec(opt.command);
                  },
                }),
              ),
            }),
          ],
        }),
      ],
    }),
  });
