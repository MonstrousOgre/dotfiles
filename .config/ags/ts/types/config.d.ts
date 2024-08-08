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
    lock: string;
    logout: string;
    restart: string;
    shutdown: string;
  };
  osd: {
    allMonitors: boolean;
    timeout: number;
  };
  notifications: {
    allMonitors: boolean;
  };
};
