import icons from "../../../utils/icons";

import Wp from "gi://AstalWp";
import { bind } from "astal";
import { openMenu } from "../../../utils/menu";

const Volume = () => {
  const audio = Wp.get_default()!.audio;
  const { muted, low, high, medium, overamplified } = icons.volume;

  return (
    <button
      className={"audio"}
      onButtonPressEvent={(clicked, event) => {
        openMenu(clicked, event, "audiomenu");
      }}
    >
      {bind(audio, "defaultSpeaker").as((defaultSpeaker) => {
        return <icon icon={bind(defaultSpeaker, "volumeIcon")} />;
      })}
    </button>
  );
};

export default Volume;
