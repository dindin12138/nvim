local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

require("packer").startup({
	function(use)
		use({ "wbthomason/packer.nvim" })
		-------------------- completion --------------------
		use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" })
		use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
		use({ "onsails/lspkind-nvim" })
		use({ "tami5/lspsaga.nvim" })
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-vsnip",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
			},
		})
		use({ "hrsh7th/vim-vsnip" })
		use({ "rafamadriz/friendly-snippets" })
		-------------------- editor --------------------
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use({ "windwp/nvim-autopairs" })
		-------------------- lang --------------------
		use({ "simrat39/rust-tools.nvim" })
		-------------------- tools --------------------
		use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" })
		use({ "LinArcX/telescope-env.nvim" })
		use({ "ahmedkhalf/project.nvim" })
		use({ "dstein64/vim-startuptime" })
		use({ "akinsho/toggleterm.nvim" })
		-------------------- ui --------------------
		use({ "catppuccin/nvim", as = "catppuccin" })
		use({ "glepnir/dashboard-nvim" })
		use({ "nvim-lualine/lualine.nvim", requires = "kyazdani42/nvim-web-devicons" })
		use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "famiu/bufdelete.nvim" } })
		use({ "lukas-reineke/indent-blankline.nvim" })
		use({ "rcarriga/nvim-notify" })
	end,
	config = {
		max_jobs = 16,
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
