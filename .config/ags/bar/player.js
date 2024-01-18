import Mpris from "resource:///com/github/Aylur/ags/service/mpris.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";

const Player = () =>
  Widget.Box({
    children: [
      Widget.Button({
        class_name: "media nohover",
        on_scroll_up: () => Mpris.getPlayer("playerctld")?.next(),
        on_scroll_down: () => Mpris.getPlayer("playerctld")?.previous(),
        child: Widget.Label({
          class_name: "track",
          label: "-",
          truncate: "end",
          xalign: 0,
          max_width_chars: 50,
          wrap: true,
          use_markup: true,
        }).hook(
          Mpris,
          (self) => {
            if (Mpris.getPlayer("playerctld")?.track_title !== "Unknown title") {
              const { track_artists, track_title } = Mpris.getPlayer("playerctld");
              const text =
                track_artists && track_artists[0] ? `${track_artists.join(", ")} - ${track_title}` : track_title;
              self.label = self.tooltip_text = text;
            } else {
              self.label = "Nothing is playing";
            }
          },
          "changed",
        ),
      }).hook(
        Mpris,
        (self) => {
          if (Mpris.getPlayer("playerctld")?.track_title !== "Unknown title") {
            self.toggleClassName("disabled", false);
          } else {
            self.toggleClassName("disabled", true);
          }
        },
        "changed",
      ),
      Widget.Button({
        class_name: "media icon",
        on_primary_click: () => Mpris.getPlayer("playerctld")?.previous(),
        child: Widget.Icon("media-skip-backward-symbolic"),
      }).hook(
        Mpris,
        (self) => {
          if (Mpris.getPlayer("playerctld")?.can_go_prev) {
            self.toggleClassName("disabled", false);
          } else {
            self.toggleClassName("disabled", true);
          }
        },
        "changed",
      ),
      Widget.Button({
        class_name: "media icon",
        on_primary_click: () => Mpris.getPlayer("playerctld")?.playPause(),
        child: Widget.Icon("").hook(Mpris, (self) => {
          if (Mpris.getPlayer("playerctld")?.play_back_status !== "Playing") {
            self.icon = "media-playback-start-symbolic";
          } else {
            self.icon = "media-playback-pause-symbolic";
          }
        }),
      }).hook(
        Mpris,
        (self) => {
          if (Mpris.getPlayer("playerctld")?.can_play) {
            self.toggleClassName("disabled", false);
          } else {
            self.toggleClassName("disabled", true);
          }
        },
        "changed",
      ),
      Widget.Button({
        class_name: "media icon",
        on_primary_click: () => Mpris.getPlayer("playerctld")?.next(),
        //child: Widget.Icon("media-seek-forward-symbolic"),
        child: Widget.Icon("media-skip-forward-symbolic"),
      }).hook(
        Mpris,
        (self) => {
          if (Mpris.getPlayer("playerctld")?.can_go_next) {
            self.toggleClassName("disabled", false);
          } else {
            self.toggleClassName("disabled", true);
          }
        },
        "changed",
      ),
    ],
  });

export default Player;
