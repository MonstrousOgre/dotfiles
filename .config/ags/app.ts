import { App } from "astal/gtk3";
import style from "./style.scss";
import Bar from "./widget/bar/Bar";
import Hyprland from "gi://AstalHyprland";
import config from "./config.json";
import main from "./widget/menus/main";

App.start({
  css: style,
  main() {
    const monitors = Hyprland.get_default().monitors;
    const windows = monitors
      .filter(
        (monitor) => config.bars[monitor.name as keyof typeof config.bars],
      )
      .map(Bar);
    main.forEach((window) => App.add_window(window));
  },
});
