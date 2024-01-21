import App from "resource:///com/github/Aylur/ags/app.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";

import icons from "../icons.js";

const Toggler = (action) =>
  Widget.Button({
    onPrimaryClickRelease: action,
    child: Widget.Icon(icons.pan.down),
  });

export default Toggler;
