import { bind } from "astal";
import { Astal, Gtk } from "astal/gtk3";
import Hyprland from "gi://AstalHyprland";
import Network from "gi://AstalNetwork";
import config from "../../config.json";
import { Workspaces } from "./workspaces";
import WindowTitle from "./windowtitle";
import Session from "./session";
import Clock from "./clock";
import IdleInhibitor from "./idleinhibitor";
import Volume from "./volume";
import SysTray from "./systray";

import { BarConfig } from "../../types/BarConfig";
import BatteryWidget from "./battery";
import Player from "./player";
import Notifications from "./notifications";

function Wifi() {
  const network = Network.get_default();
  const wifi = bind(network, "wifi");

  return (
    <box visible={wifi.as(Boolean)}>
      {wifi.as(
        (wifi) =>
          wifi && (
            <icon
              tooltipText={bind(wifi, "ssid").as(String)}
              className="Wifi"
              icon={bind(wifi, "iconName")}
            />
          ),
      )}
    </box>
  );
}

const widget = {
  workspaces: (monitor: Hyprland.Monitor) => Workspaces(monitor),
  windowtitle: (_monitor: Hyprland.Monitor) => WindowTitle(),
  session: (_monitor: Hyprland.Monitor) => Session(),
  systray: (_monitor: Hyprland.Monitor) => SysTray(),
  clock: (_monitor: Hyprland.Monitor) => Clock(),
  idleinhibitor: (_monitor: Hyprland.Monitor) => IdleInhibitor(),
  volume: (_monitor: Hyprland.Monitor) => Volume(),
  battery: (_monitor: Hyprland.Monitor) => BatteryWidget(),
  player: (_monitor: Hyprland.Monitor) => Player(),
  notifications: (_monitor: Hyprland.Monitor) => Notifications(),
};

type WidgetConfig = keyof typeof widget;

export default (monitor: Hyprland.Monitor) => {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  const start = config.bars[monitor.name as BarConfig].start.map((key) =>
    widget[key as WidgetConfig](monitor),
  );

  const center = config.bars[monitor.name as BarConfig].center.map((key) =>
    widget[key as WidgetConfig](monitor),
  );

  const end = config.bars[monitor.name as BarConfig].end.map((key) =>
    widget[key as WidgetConfig](monitor),
  );

  return (
    <window
      className="Bar"
      monitor={monitor.id}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
    >
      <centerbox>
        <box hexpand halign={Gtk.Align.START}>
          {start}
        </box>
        <box>{center}</box>
        <box hexpand halign={Gtk.Align.END}>
          {end}
        </box>
      </centerbox>
    </window>
  );
};
