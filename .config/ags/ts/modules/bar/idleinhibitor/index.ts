import Variable from "resource:///com/github/Aylur/ags/variable.js";
import icons from "ts/utils/icons";

const inhibiting = Variable(false);

// let proc;

const IdleInhibitor = () =>
  Widget.Button({
    className: inhibiting.bind().as((v) => (v ? "inhibiting" : "")),
    child: Widget.Icon(icons.idleInhibit),
    onPrimaryClick: () => {
      if (inhibiting.value) {
        // proc.force_exit();
        Utils.exec("systemctl --user stop wayland-idle-inhibitor.service");
        inhibiting.value = false;
      } else {
        // proc = Utils.subprocess("wayland-idle-inhibitor.py");
        Utils.exec("systemctl --user start wayland-idle-inhibitor.service");
        inhibiting.value = true;
      }
    },
  });

export default IdleInhibitor;
