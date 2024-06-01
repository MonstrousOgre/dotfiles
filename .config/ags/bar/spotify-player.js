import Mpris from "resource:///com/github/Aylur/ags/service/mpris.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";

import { defaultPlayerName } from "../options.js";
import icons from "../icons.js";

const { prev, play, pause, next } = icons.player;

const SpotifyPlayer = () =>
  Widget.Box({
    children: [
      Widget.Button({
        className: "media nohover",
        onScrollUp: () => Mpris.getPlayer("spotify")?.next(),
        onScrollDown: () => Mpris.getPlayer("spotify")?.previous(),
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
            if (Mpris.getPlayer("spotify")?.trackTitle !== "Unknown title") {
              const { trackArtists, trackTitle } = Mpris.getPlayer("spotify");
              const text =
                trackArtists &&
                trackArtists[0] &&
                trackArtists[0] !== "Unknown artist"
                  ? `${trackArtists.join(", ")} - ${trackTitle}`
                  : trackTitle;
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
          if (Mpris.getPlayer("spotify")?.trackTitle !== "Unknown title") {
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
          if (Mpris.getPlayer("spotify")?.canGoPrev) {
            self.toggleClassName("disabled", false);
          } else {
            self.toggleClassName("disabled", true);
          }
        },
        "changed",
      ),
      Widget.Button({
        className: "media icon",
        onPrimaryClick: () => Mpris.getPlayer("spotify")?.playPause(),
        child: Widget.Icon("").hook(Mpris, (self) => {
          if (Mpris.getPlayer("spotify")?.playBackStatus !== "Playing") {
            self.icon = play;
          } else {
            self.icon = pause;
          }
        }),
      }).hook(
        Mpris,
        (self) => {
          if (Mpris.getPlayer("spotify")?.canPlay) {
            self.toggleClassName("disabled", false);
          } else {
            self.toggleClassName("disabled", true);
          }
        },
        "changed",
      ),
      Widget.Button({
        className: "media icon",
        onPrimaryClick: () => Mpris.getPlayer("spotify")?.next(),
        //child: Widget.Icon("media-seek-forward-symbolic"),
        child: Widget.Icon(next),
      }).hook(
        Mpris,
        (self) => {
          if (Mpris.getPlayer("spotify")?.canGoNext) {
            self.toggleClassName("disabled", false);
          } else {
            self.toggleClassName("disabled", true);
          }
        },
        "changed",
      ),
    ],
  });

export default SpotifyPlayer;
