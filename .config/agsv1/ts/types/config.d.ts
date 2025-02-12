type BarModule =
  | "workspace"
  | "windowtitle"
  | "player"
  | "clock"
  | "idleinhibitor"
  | "systray";

type ConfigOptions = {
  bars: {
    [key: string]: {
      spacing: number;
      start?: BarModule[];
      center?: BarModule[];
      end?: BarModule[];
    };
  };
  workspaces: {
    formatIcons: {
      [key: string]: string;
    };
    persistentWorkspaces: number[];
  };
  windowtitle: {
    text: "app" | "window";
    showIcon: boolean;
    tooltipText: "app" | "window";
  };
  clock: {
    shortTimeFormat: string;
    longTimeFormat: string;
  };
  session: {
    options: {
      command: string;
      icon: string;
      text: string;
    }[];
  };
  osd: {
    allMonitors: boolean;
    timeout: number;
  };
  notifications: {
    allMonitors: boolean;
  };
};
