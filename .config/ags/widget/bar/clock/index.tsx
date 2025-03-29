import { bind, Variable } from "astal";
import options from "../../../config.json";
import { openMenu } from "../../../utils/menu";

const Clock = () => {
  const timeFormat = options.clock.shortTimeFormat;
  const time = Variable("0").poll(1000, ["date", timeFormat]);
  return (
    <button
      onButtonPressEvent={(clicked, event) => {
        openMenu(clicked, event, "calendarmenu");
      }}
    >
      <label className={"clock"}>{bind(time)}</label>
    </button>
  );
};

export default Clock;
