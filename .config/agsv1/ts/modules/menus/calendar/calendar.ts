export const CalendarWidget = () =>
  Widget.Calendar({
    expand: true,
    hpack: "fill",
    vpack: "fill",
    className: "calendar-menu-widget",
    showDayNames: true,
    showDetails: false,
    showHeading: true,
  });
