const battery = await Service.import("battery");

const RemainingWidget = () =>
  Widget.Label().hook(
    battery,
    (self) =>
      (self.label = `${new Date(battery.time_remaining * 1000).toISOString().slice(11, 19)} left to ${
        battery.charging || battery.charged ? "charge" : "discharge"
      }`),
  );

export default RemainingWidget;
