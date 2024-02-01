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
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {
    'freddiehaddad/feline.nvim'
  },
  -- { 'voldikss/vim-floaterm' },
  -- amongst your other plugins
  { 'akinsho/toggleterm.nvim',             version = "*", config = true },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl",  opts = {} },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },

  { "tanvirtin/monokai.nvim" },

  --{ 'preservim/nerdcommenter' },
  { 'numToStr/Comment.nvim' },

  { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },

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

  { "tpope/vim-fugitive" },

  { "lewis6991/gitsigns.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
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

  { 'kevinhwang91/nvim-ufo',   dependencies = 'kevinhwang91/promise-async' },

  { "luukvbaal/statuscol.nvim" },

})
