-- 自动安装 Packer.nvim
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("正在安装Pakcer.nvim，请稍后...")
  paccker_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    -- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
    install_path,
  })

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("没有安装 packer.nvim")
  return
end

packer.startup({
  function(use)
    use({ 'wbthomason/packer.nvim' })
    -------------------- completion --------------------
    use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" })
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    use({ "onsails/lspkind-nvim" })
    use({ "tami5/lspsaga.nvim" })
    use({ "hrsh7th/nvim-cmp", requires = {
      "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-vsnip", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline"
    } })
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
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
    use({ "lukas-reineke/indent-blankline.nvim" })
  end,
  config = {
    -- 并发数限制
    max_jobs = 16,
    -- 浮动窗口
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  },
})
