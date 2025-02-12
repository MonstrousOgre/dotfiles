import icons from "ts/utils/icons";
import Gdk from "types/@girs/gdk-3.0/gdk-3.0";
import { openMenu } from "../utils";

const Session = () =>
  Widget.Button({
    child: Widget.Icon(icons.session.shutdown),
    onPrimaryClick: (clicked: any, event: Gdk.Event) =>
      openMenu(clicked, event, "sessionmenu"),
  });

export default Session;
