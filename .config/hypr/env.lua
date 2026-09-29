---@module 'hl'

hl.env("XCURSOR_SIZE", 24)

hl.env("_JAVA_AWT_WM_NONREPARENTING", 1)

hl.env("LIBVA_DRIVER_NAME", "nvidia")

hl.env("XDG_SESSION_TYPE", "wayland")

-- hl.env("GBM_BACKEND", "nvidia-drm")

-- hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

hl.env("WLR_NO_HARDWARE_CURSORS", 1)

hl.env("MOZ_ENABLE_WAYLAND", 1)

-- hl.env("MOZ_DBUS_REMOTE", 1)

hl.env("HYPRSHOT_DIR", os.getenv("HOME") .. "/Pictures")

hl.env("GDK_BACKEND", "wayland,x11")

-- hl.env("QT_QPA_PLATFORM", "wayland")

hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("QT_STYLE_OVERRIDE", "kvantum")

-- hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
-- hl.env("QT_QPA_PLATFORMTHEME", "qtengine")

-- hl.env("QT_QUICK_CONTROLS_STYLE", "org.kde.desktop")
-- hl.env("QT_STYLE_OVERRIDE", "kvantum")
-- hl.env("QT_STYLE_OVERRIDE", "klassy")

hl.env("SDL_VIDEODRIVER", "wayland")

hl.env("CLUTTER_BACKEND", "wayland")

-- hl.env("WLR_DRM_NO_ATOMIC", 1)

hl.env("XDG_MENU_PREFIX", "plasma-")
