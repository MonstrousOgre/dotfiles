import Mpris from "resource:///com/github/Aylur/ags/service/mpris.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";

import { defaultPlayerName } from "../options.js";
import icons from "../icons.js";

const { prev, play, pause, next } = icons.player;

const Player = () =>
  Widget.Box({
    children: [
      Widget.Button({
        className: "media nohover",
        onScrollUp: () => Mpris.getPlayer(defaultPlayerName)?.next(),
        onScrollDown: () => Mpris.getPlayer(defaultPlayerName)?.previous(),
        child: Widget.Label({
          className: "track",
          label: "-",
          truncate: "end",
          xalign: 0,
          maxWidthChars: 50,
          wrap: true,
          useMarkup: true,
        }).hook(
          Mpris,
          (self) => {
            if (Mpris.getPlayer(defaultPlayerName)?.trackTitle !== "Unknown title") {
              const { trackArtists, trackTitle } = Mpris.getPlayer(defaultPlayerName);
              const text = trackArtists && trackArtists[0] ? `${trackArtists.join(", ")} - ${trackTitle}` : trackTitle;
              self.label = self.tooltipText = text;
            } else {
              self.label = "Nothing is playing";
            }
          },
          "changed",
        ),
      }).hook(
        Mpris,
        (self) => {
          if (Mpris.getPlayer(defaultPlayerName)?.trackTitle !== "Unknown title") {
            self.toggleClassName("disabled", false);
          } else {
            self.toggleClassName("disabled", true);
          }
        },
        "changed",
      ),
      Widget.Button({
        className: "media icon",
        onPrimaryClick: () => Mpris.getPlayer(defaultPlayerName)?.previous(),
        child: Widget.Icon(prev),
      }).hook(
        Mpris,
        (self) => {
          if (Mpris.getPlayer(defaultPlayerName)?.canGoPrev) {
            self.toggleClassName("disabled", false);
          } else {
            self.toggleClassName("disabled", true);
          }
        },
        "changed",
      ),
      Widget.Button({
        className: "media icon",
        onPrimaryClick: () => Mpris.getPlayer(defaultPlayerName)?.playPause(),
        child: Widget.Icon("").hook(Mpris, (self) => {
          if (Mpris.getPlayer(defaultPlayerName)?.playBackStatus !== "Playing") {
            self.icon = play;
          } else {
            self.icon = pause;
          }
        }),
      }).hook(
        Mpris,
        (self) => {
          if (Mpris.getPlayer(defaultPlayerName)?.canPlay) {
            self.toggleClassName("disabled", false);
          } else {
            self.toggleClassName("disabled", true);
          }
        },
        "changed",
      ),
      Widget.Button({
        className: "media icon",
        onPrimaryClick: () => Mpris.getPlayer(defaultPlayerName)?.next(),
        //child: Widget.Icon("media-seek-forward-symbolic"),
        child: Widget.Icon(next),
      }).hook(
        Mpris,
        (self) => {
          if (Mpris.getPlayer(defaultPlayerName)?.canGoNext) {
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
