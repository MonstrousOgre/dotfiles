import DropdownMenu from "../DropDownMenu";
import { AudioInput } from "./input";
// import AudioInput from "./input";
import { AudioOutput } from "./output";

export default () => (
  <DropdownMenu name="audiomenu">
    <box
      className={"audio-menu-content"}
      css={"padding: 1px; margin: -1px"}
      vexpand
    >
      <box className={"audio-menu-content-items"} spacing={10} vertical>
        <AudioOutput />
        <AudioInput />
      </box>
    </box>
  </DropdownMenu>
);
