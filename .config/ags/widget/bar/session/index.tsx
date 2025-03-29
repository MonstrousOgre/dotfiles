import icons from "../../../utils/icons";
import { openMenu } from "../../../utils/menu";

const Session = () => {
  return (
    <button
      onButtonPressEvent={(clicked, event) => {
        openMenu(clicked, event, "sessionmenu");
      }}
    >
      <icon icon={icons.session.shutdown}></icon>
    </button>
  );
};
export default Session;
