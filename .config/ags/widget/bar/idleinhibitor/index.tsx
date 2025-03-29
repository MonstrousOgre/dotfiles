import { bind, exec, Variable } from "astal";
import icons from "../../../utils/icons";

const inhibiting = Variable(false);

// const inhibiting = Variable(false).poll(
//   1000,
//   [
//     "bash",
//     "-c",
//     "'systemctl --user is-active wayland-idle-inhibitor.service || true'",
//   ],
//   (val) => {
//     console.log(val);
//     return val === "active";
//   },
// );

const IdleInhibitor = () => (
  <button
    className={bind(inhibiting).as((v) => (v ? "inhibiting" : ""))}
    onButtonPressEvent={(self, event) => {
      if (event.get_button()[1] === 1) {
        if (inhibiting.get()) {
          // proc.force_exit();
          exec("systemctl --user stop wayland-idle-inhibitor.service");
          inhibiting.set(false);
        } else {
          // proc = Utils.subprocess("wayland-idle-inhibitor.py");
          exec("systemctl --user start wayland-idle-inhibitor.service");
          inhibiting.set(true);
        }
      }
    }}
  >
    <icon icon={icons.idleInhibit} />
  </button>
);
export default IdleInhibitor;
