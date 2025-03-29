import { bind, Variable } from "astal";
import options from "../../../config.json";

const TimeWidget = () => {
  const timeFormat = options.clock.longTimeFormat;
  const time = Variable("0").poll(1000, ["date", timeFormat]);
  return <label className={"time"}>{bind(time)}</label>;
};

export default TimeWidget;
