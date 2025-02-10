local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- "folke/which-key.nvim",
  -- { "folke/neoconf.nvim", cmd = "Neoconf" },
  -- "folke/neodev.nvim",

  {
    "echasnovski/mini.icons",
    opts = {},
    lazy = true,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   version = "*",
  --   lazy = false,
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --   },
  -- },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },

  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {
    'freddiehaddad/feline.nvim'
  },
  { 'voldikss/vim-floaterm' },
  -- amongst your other plugins
  -- { 'akinsho/toggleterm.nvim',             version = "*", config = true },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  -- { "lukas-reineke/indent-blankline.nvim", version = "=3.5.4" },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },

  { "tanvirtin/monokai.nvim" },

  --{ 'preservim/nerdcommenter' },
  { 'numToStr/Comment.nvim' },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      -- NOTE: additional parser
      { "nushell/tree-sitter-nu" },
    },
    build = ":TSUpdate"
  },

  { "baskerville/vim-sxhkdrc" },

  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip" },

  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  {
    'stevearc/conform.nvim',
    opts = {},
  },

  { "onsails/lspkind-nvim" },

  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup {}
    end
  },

  {
    "aznhe21/actions-preview.nvim",
    config = function()
      vim.keymap.set({ "v", "n" }, "gf", require("actions-preview").code_actions)
    end,
  },

  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },

  { "tpope/vim-fugitive" },

  { "lewis6991/gitsigns.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    -- dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' }
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    'kosayoda/nvim-lightbulb',
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = { enabled = true },
        sign = { enabled = false },
        virtual_text = { enabled = true },
        float = { enabled = false },
      })
    end
  },

  -- {
  --   'nvimdev/lspsaga.nvim',
  --   config = function()
  --     require('lspsaga').setup({})
  --   end,
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',   -- optional
  --     'nvim-tree/nvim-web-devicons',       -- optional
  --   }
  -- },

  { 'kevinhwang91/nvim-ufo',   dependencies = 'kevinhwang91/promise-async' },

  { "luukvbaal/statuscol.nvim" },

  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        -- "<leader>-",
        "<leader>fy",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        -- NOTE: this requires a version of yazi that includes
        -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
        -- "<c-up>",
        "<leader>y",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    ---@type YaziConfig
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = true,
      keymaps = {
        show_help = "<f1>",
      },
    },
  }
})
