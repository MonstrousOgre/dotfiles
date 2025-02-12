const Audio = await Service.import("audio");

export const Devices = (type: "speaker" | "microphone") => {
  const typePlural = type + "s";
  return Widget.Box({ className: "devices", vertical: true }).hook(
    Audio,
    (self) => {
      if (Audio[typePlural]) {
        self.children = Audio[typePlural].map((device) =>
          Widget.Button({
            className: `${Audio[type].id === device.id ? "selected" : ""}`,
            child: Widget.Label({
              maxWidthChars: 50,
              truncate: "end",
              useMarkup: true,
              label: device.description,
              tooltipText: device.description,
            }),
            onPrimaryClick: () => {
              Audio[type] = device;
            },
          }),
        );
      }
    },
  );
};
