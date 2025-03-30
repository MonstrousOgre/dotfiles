import Mpris from "gi://AstalMpris";
import icons from "../../../utils/icons";
import { Gdk } from "astal/gtk3";
import { bind } from "astal";
import { openMenu } from "../../../utils/menu";

const Player = ({ playername } = { playername: "playerctld" }) => {
  const player = Mpris.Player.new(playername);
  return (
    <box>
      {bind(player, "identity").as((identity) => (
        <button
          className={`media nohover ${!identity && "disabled"}`}
          onScroll={(self, event) => {
            switch (event.direction) {
              case Gdk.ScrollDirection.UP:
                player.next();
                break;
              case Gdk.ScrollDirection.DOWN:
                player.previous();
                break;
            }
          }}
          onButtonPressEvent={(self, event) => {
            openMenu(self, event, "playersmenu");
          }}
        >
          <box spacing={10}>
            {bind(player, "entry").as((entry) =>
              entry ? <icon icon={entry} /> : <></>,
            )}
            {bind(player, "title").as((title) => (
              <label
                className={`track}`}
                xalign={0}
                maxWidthChars={50}
                truncate
                wrap
                useMarkup
              >
                {identity
                  ? bind(player, "artist").as((artist) =>
                      artist && artist !== "" ? `${artist} - ${title}` : title,
                    )
                  : "No Media playing"}
              </label>
            ))}
          </box>
        </button>
      ))}
      <button
        className={bind(player, "canGoPrevious").as(
          (canGoPrevious) => `media icon  ${canGoPrevious ? "" : "disabled"}`,
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
          (canGoNext) => `media icon  ${canGoNext ? "" : "disabled"}`,
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
          (canGoNext) => `media icon  ${canGoNext ? "" : "disabled"}`,
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
  );
};

export default Player;
