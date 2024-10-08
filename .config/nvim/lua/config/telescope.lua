local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fp', builtin.builtin, {})
vim.keymap.set('n', '<leader><leader>', builtin.commands, {})

require('telescope').setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    -- ["ui-select"] = {
    --   require("telescope.themes").get_dropdown {
    --     -- even more opts
    --   }
    --
    --   -- pseudo code / specification for writing custom displays, like the one
    --   -- for "codeactions"
    --   -- specific_opts = {
    --   --   [kind] = {
    --   --     make_indexed = function(items) -> indexed_items, width,
    --   --     make_displayer = function(widths) -> displayer
    --   --     make_display = function(displayer) -> function(e)
    --   --     make_ordinal = function(e) -> string
    --   --   },
    --   --   -- for example to disable the custom builtin "codeactions" display
    --   --      do the following
    --   --   codeactions = false,
    --   -- }
    -- }
  }
}
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
-- require("telescope").load_extension("ui-select")
