local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd("packadd packer.nvim")
end

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

	use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })

	--[[use {]]
	--[['glepnir/galaxyline.nvim',]]
	--[[branch = 'main',]]
	--[[requires = {'kyazdani42/nvim-web-devicons', opt = true}]]
	--[[}]]

	use({ "famiu/feline.nvim", requires = { "lewis6991/gitsigns.nvim", "kyazdani42/nvim-web-devicons" } })

	use("voldikss/vim-floaterm")

	use("lukas-reineke/indent-blankline.nvim")

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})

	--use("sjl/badwolf")
	use("tanvirtin/monokai.nvim")
	--use("psliwka/termcolors.nvim")

	use("preservim/nerdcommenter")

	-- Better Syntax Support
	--use("sheerun/vim-polyglot")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use("baskerville/vim-sxhkdrc")

	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") -- Snippets plugin use 'neovim/nvim-lspconfig'
	use("williamboman/nvim-lsp-installer")

	--use("rafamadriz/friendly-snippets")

	use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" } })

	use("onsails/lspkind-nvim")

	use("tpope/vim-fugitive")
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
end)
