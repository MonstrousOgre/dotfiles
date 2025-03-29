import Battery from "gi://AstalBattery";
import { openMenu } from "../../../utils/menu";
import { bind } from "astal";

const battery = Battery.get_default();

const BatteryWidget = () => {
  return (
    <button
      visible={bind(battery, "isPresent")}
      tooltipText={`${new Date((battery.charging ? battery.timeToFull : battery.timeToEmpty) * 1000).toISOString().slice(11, 19)} left to ${
        battery.charging ? "charge" : "discharge"
      }`}
    >
      <box spacing={8}>
        <icon icon={bind(battery, "iconName")} />
        <label>{bind(battery, "percentage").as((v) => `${v * 100}%`)}</label>
      </box>
    </button>
  );
};
export default BatteryWidget;
