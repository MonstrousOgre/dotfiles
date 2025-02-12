import Gdk from "types/@girs/gdk-3.0/gdk-3.0";
import { openMenu } from "../utils";

const battery = await Service.import("battery");

const Battery = () =>
  Widget.Button({
    child: Widget.Box({
      spacing: 8,
      children: [
        Widget.Icon({ icon: battery.bind("icon_name") }),
        Widget.Label({ label: battery.bind("percent").as((v) => `${v}%`) }),
      ],
    }),
    onPrimaryClick: (clicked: any, event: Gdk.Event) =>
      openMenu(clicked, event, "powermenu"),
  });

export default Battery;
