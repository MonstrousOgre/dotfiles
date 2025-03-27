import icons from "../../../utils/icons";
import { openMenu } from "../../../utils/barUtils";

const Session = () => {
  return (
    <button
      onClick={(clicked, event) => {
        openMenu(clicked, event.x, event.y, "sessionmenu");
      }}
    >
      <icon icon={icons.session.shutdown}></icon>
    </button>
  );
};
export default Session;
