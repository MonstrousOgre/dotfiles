import icons from "../../../utils/icons";
import DropdownMenu from "../DropDownMenu";
import options from "../../../config.json";
import DropDownMenu from "../DropDownMenu";
import { exec } from "astal";

export default () => {
  return (
    <DropDownMenu name="sessionmenu">
      <box
        className={"session-menu-content"}
        css={"padding: 1px; margin: -1px;"}
        vexpand={false}
      >
        <box spacing={20} className={"vert"} vertical>
          <label className="user" label={exec("sh -c 'echo $USER'")} />
          <box vertical>
            {options.session.options.map((opt) => (
              <button onClickRelease={() => exec(opt.command)}>
                <box spacing={10}>
                  <icon
                    icon={icons.session[opt.icon as keyof typeof icons.session]}
                  ></icon>
                  <label>{opt.text}</label>
                </box>
              </button>
            ))}
          </box>
        </box>
      </box>
    </DropDownMenu>
  );
};
