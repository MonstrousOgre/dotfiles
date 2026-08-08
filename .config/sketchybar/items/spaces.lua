---@type RiftAPI
local rift = require("riftapi")

-- ...
local json = require('cjson')

local colors = require("colors")

local spaces = {}

local function mouse_click(env, ws_index)
  if env.BUTTON == "right" then
    -- rift.workspace.create()
  else
    rift.workspace.switch(ws_index)
  end
end

local function space_selection(env)
  local event_info = json.decode(env.INFO)
  local space_id = event_info.workspace_id.idx
  local workspace_name = event_info.workspace_name

  for _, space in pairs(spaces) do
    sbar.set(space, {
      background = {
        color = workspace_name == space and colors.hightlight or colors.transparent,
      },
    })
  end
end

local function windows_changed(env)
  local workspaces, err = rift.query.workspaces()
  if not workspaces then
    error(err)
  end
  local window_counts = {}
  for _, ws in pairs(workspaces) do
    window_counts[ws.name] = ws.window_counttransparent
  end
  for _, space in pairs(spaces) do
    sbar.set(space, {
      icon = {
        color = window_counts[space] > 0 and colors.white or colors.grey,
      },
    })
  end
end

local function setup_workspaces()
  if (#spaces > 0) then return end
  local workspaces, err = rift.query.workspaces()
  if not workspaces then
    error(err)
  end
  for _, ws in pairs(workspaces) do
    local ws_index = ws.index
    local space = sbar.add("item", ws.name, {
      icon = {
        string = ws_index + 1,
        padding_left = 8,
        padding_right = 8,
        color = ws.window_count > 0 and colors.white or colors.grey,
      },
      background = {
        height = 16,
        color = ws.is_active and colors.hightlight or colors.transparent,
        border_color = colors.bar.border,
        corner_radius = 4,
        border_width = 0,
      },
      label = {
        string = ws.name,
        color = colors.grey,
        highlight_color = colors.white,
        drawing = false,
      },
    })
    spaces[ws_index] = ws.name
    space:subscribe("mouse.clicked", function(env) mouse_click(env, ws_index) end)
  end
  rift.subscribe({ "workspace_changed" }, space_selection)
  rift.subscribe({ "windows_changed" }, windows_changed)
end

setup_workspaces()

sbar.add("bracket", "space_bracket", spaces, {
  background = { drawing = false },
})
