import { App } from "astal/gtk3";
import style from "./style.scss";
import Bar from "./widget/Bar";
import Hyprland from "gi://AstalHyprland";
import config from "./config.json";

App.start({
  css: style,
  main() {
    const monitors = Hyprland.get_default().monitors;
    monitors
      .filter(
        (monitor) => config.bars[monitor.name as keyof typeof config.bars],
      )
      .map(Bar);
  },
});
