import DropDownMenu from "../DropDownMenu";
import { CalendarWidget } from "./calendar";
import TimeWidget from "./time";

export default () => {
  return (
    <DropDownMenu name="calendarmenu">
      <box
        className={"calendar-menu-content"}
        css={"padding: 1px; margin: -1px;"}
      >
        <box className={"calendar-menu-content-items"} spacing={10} vertical>
          <TimeWidget />
          <CalendarWidget />
        </box>
      </box>
    </DropDownMenu>
  );
};
