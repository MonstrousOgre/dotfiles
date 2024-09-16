import { options } from "ts/globals";
import { Monitor } from "types/service/hyprland";
import WindowTitle from "./windowtitle/index";
import Workspaces from "./workspaces/index";
import SysTray from "./systray/index";
import Player from "./player/index";
import Clock from "./clock/index";
import IdleInhibitor from "./idleinhibitor/index";
import Volume from "./volume/index";
import Session from "./session/index";
import Battery from "./battery/index";

const widget = {
  workspaces: (monitor: Monitor) => Workspaces(monitor),
  windowtitle: (_monitor: Monitor) => WindowTitle(),
  player: (_monitor: Monitor) => Player(),
  systray: (_monitor: Monitor) => SysTray(),
  clock: (_monitor: Monitor) => Clock(),
  volume: (_monitor: Monitor) => Volume(),
  idleinhibitor: (_monitor: Monitor) => IdleInhibitor(),
  session: (_monitor: Monitor) => Session(),
  battery: (_monitor: Monitor) => Battery(),
};

const Modules = (
  modules: BarModule[],
  monitor: Monitor,
  hpack: "start" | "center" | "end",
  spacing = 8,
) => {
  const widgets = modules.map((module) => widget[module](monitor));
  return Widget.Box({
    hpack,
    spacing: spacing,
    children: widgets,
  });
};

export default (monitor: Monitor) => {
  const barLayout = options.bars[monitor.name];

  const modules = ["start", "center", "end"].map((pos) =>
    Modules(
      barLayout[pos],
      monitor,
      pos as "start" | "center" | "end",
      barLayout.spacing,
    ),
  );

  return Widget.Window({
    // name: `bar-${monitor.id}`,
    name: `bar`,
    class_name: "bar",
    monitor: monitor.id,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      start_widget: modules[0],
      center_widget: modules[1],
      end_widget: modules[2],
    }),
  });
};
