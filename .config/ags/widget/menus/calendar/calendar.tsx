import GObject from "gi://GObject";
import { Gtk, astalify, type ConstructProps } from "astal/gtk3";

// type CalendarProps = ConstructProps<
//   Gtk.Calendar,
//   Gtk.Calendar.ConstructorProps
// >;
// const Calendar = astalify<Gtk.Calendar, Gtk.Calendar.ConstructorProps>(
//   Gtk.Calendar,
//   {
//     // if it is a container widget, define children setter and getter here
//     getChildren(self) {
//       return [];
//     },
//     setChildren(self, children) {},
//   },
// );

class Calendar extends astalify(Gtk.Calendar) {
  static {
    GObject.registerClass(this);
  }

  constructor(
    props: ConstructProps<
      Calendar,
      Gtk.Calendar.ConstructorProps,
      { onColorSet: [] } // signals of Gtk.ColorButton have to be manually typed
    >,
  ) {
    super(props as any);
  }
}

export const CalendarWidget = () => {
  return (
    <Calendar
      expand
      className={"calender-menu-widget"}
      showDayNames
      showDetails={false}
      showHeading
    />
  );
};
