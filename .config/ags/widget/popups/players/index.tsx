import Mpris from "gi://AstalMpris";
import icons from "../../../utils/icons";
import { Gtk } from "astal/gtk3";
import DropDownMenu from "../DropDownMenu";
import { bind } from "astal";

export default () => {
  const mpris = Mpris.get_default();
  return (
    <DropDownMenu name="playersmenu">
      <box
        className={"player-menu-content"}
        css={"padding: 1px; margin: -1px"}
        vexpand
      >
        <box className={"player-menu-content"} vertical>
          {bind(mpris, "players").as((players) =>
            players
              .filter((player) => !player.bus_name.includes("playerctld"))
              .map((player) => (
                <box vertical>
                  <box className={"player"} spacing={10}>
                    <box className={"icon"}>
                      {bind(player, "coverArt").as((coverArt) => (
                        <box
                          css={`
                            background-image: url("${coverArt}");
                            background-size: contain;
                            background-repeat: no-repeat;
                            background-position: center;
                          `}
                        />
                      ))}
                    </box>
                    <box vertical>
                      <label
                        className={"title"}
                        xalign={0}
                        justify={Gtk.Justification.LEFT}
                        hexpand
                        maxWidthChars={24}
                        truncate
                        wrap
                        useMarkup
                        tooltipMarkup={bind(player, "title")}
                      >
                        {bind(player, "title")}
                      </label>
                      <label
                        className={"artist"}
                        hexpand
                        useMarkup
                        xalign={0}
                        justify={Gtk.Justification.LEFT}
                        maxWidthChars={24}
                        truncate
                        wrap
                        tooltipMarkup={bind(player, "artist")}
                      >
                        {bind(player, "artist")}
                      </label>
                      <label
                        className={"album"}
                        hexpand
                        useMarkup
                        xalign={0}
                        justify={Gtk.Justification.LEFT}
                        maxWidthChars={24}
                        truncate
                        wrap
                        tooltipMarkup={bind(player, "album")}
                      >
                        {bind(player, "album")}
                      </label>
                    </box>
                    <box className={"controls"}>
                      <button
                        className={bind(player, "canGoPrevious").as(
                          (canGoPrevious) =>
                            `media icon  ${canGoPrevious ? "" : "disabled"}`,
                        )}
                        onButtonPressEvent={(self, event) => {
                          if (event.get_button()[1] === 1) {
                            player.previous();
                          }
                        }}
                      >
                        <icon icon={icons.player.prev} />
                      </button>
                      <button
                        className={bind(player, "canPlay").as(
                          (canGoNext) =>
                            `media icon  ${canGoNext ? "" : "disabled"}`,
                        )}
                        onButtonPressEvent={(self, event) => {
                          if (event.get_button()[1] === 1) {
                            player.play_pause();
                          }
                        }}
                      >
                        <icon
                          icon={bind(player, "playbackStatus").as((status) =>
                            status === Mpris.PlaybackStatus.PLAYING
                              ? icons.player.pause
                              : icons.player.play,
                          )}
                        />
                      </button>
                      <button
                        className={bind(player, "canGoNext").as(
                          (canGoNext) =>
                            `media icon  ${canGoNext ? "" : "disabled"}`,
                        )}
                        onButtonPressEvent={(self, event) => {
                          if (event.get_button()[1] === 1) {
                            player.next();
                          }
                        }}
                      >
                        <icon icon={icons.player.next} />
                      </button>
                    </box>
                  </box>
                  {bind(player, "position").as((position) => (
                    <slider
                      value={player.length > 0 ? position / player.length : 0}
                      onDragged={(self) => {
                        if (player.canSeek) {
                          player.set_position(self.value * player.length);
                        }
                      }}
                    />
                  ))}
                </box>
              )),
          )}
        </box>
      </box>
    </DropDownMenu>
  );
};
