import { App } from "astal/gtk3";
import { Variable, GLib, bind } from "astal";
import { Astal, Gtk, Gdk } from "astal/gtk3";
import Hyprland from "gi://AstalHyprland";
import Mpris from "gi://AstalMpris";
import Wp from "gi://AstalWp";
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

function Media() {
  const mpris = Mpris.get_default();

  return (
    <box className="Media">
      {bind(mpris, "players").as((ps) =>
        ps[0] ? (
          <box>
            <box
              className="Cover"
              valign={Gtk.Align.CENTER}
              css={bind(ps[0], "coverArt").as(
                (cover) => `background-image: url('${cover}');`,
              )}
            />
            <label
              label={bind(ps[0], "metadata").as(
                () => `${ps[0].title} - ${ps[0].artist}`,
              )}
            />
          </box>
        ) : (
          <label label="Nothing Playing" />
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
